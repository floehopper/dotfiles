{ config, pkgs, ... }:

let
  user = "jamesmead";
  userHome = "/Users/${user}";
in
{
  imports = [ <home-manager/nix-darwin> ];

  users.users.jamesmead = {
    home = userHome;
  };

  home-manager.users.jamesmead = { config, pkgs, ... }: {
    home.stateVersion = "25.05";

    home.homeDirectory = userHome;

    home.sessionPath = [
      "/opt/homebrew/opt/postgresql@17/bin"
      "/opt/homebrew/opt/trash/bin"
    ];

    home.sessionVariables = {
      EDITOR = "vim";
      LESS = "-R"; # Prevent less from escaping xterm color control chars that appear in Rails log file
      HOMEBREW_NO_ENV_HINTS = "Yes";
      ASDF_NODEJS_LEGACY_FILE_DYNAMIC_STRATEGY = "latest_available";
    };

    home.shellAliases = {
      ls = "ls -l";
      s = "git status";
      d = "git diff";
    };

    home.packages = [
      pkgs.pandoc
      pkgs.wget
    ];

    home.file."${userHome}/.config/git/nestauk.inc".text = ''
      [user]
        email = "james.mead+nestauk@gofreerange.com"
    '';

    home.file."${userHome}/.config/git/rpf.inc".text = ''
      [user]
        email = "james.mead+rpf@gofreerange.com"
    '';

    # Assumes 1Password is installed with its SSH Agent
    # See https://developer.1password.com/docs/ssh/agent
    home.file."${userHome}/.1password/agent.sock".source = config.lib.file.mkOutOfStoreSymlink "${userHome}/Library/Group\ Containers/2BUA8C4S2C.com.1password/t/agent.sock";

    home.file."${userHome}/.railsrc".text = ''
      --minimal
    '';

    home.file."${userHome}/.screenrc".text = ''
      defscrollback 100000
    '';

    programs.zsh = {
      enable = true;
      oh-my-zsh = {
        enable = true;
        plugins = [ "git-prompt" ];
      };
      envExtra = ''
      '';
      initExtra = ''
        export PATH="${userHome}/.asdf/shims:$PATH"
        ulimit -S -n 2048
      '';
    };

    programs.ssh = {
      enable = true;
      extraConfig = ''
        UseKeychain yes
        AddKeysToAgent yes
        IdentityAgent ${userHome}/.1password/agent.sock
        IdentityFile ${userHome}/.ssh/id_ed25519
        Host ssh.frankfurt.render.com ssh.oregon.render.com
          UpdateHostKeys no
      '';
    };

    programs.less.enable = true;

    programs.vim = {
      enable = true;
      settings = {
        expandtab = true;
        tabstop = 2;
        shiftwidth = 2;
        hidden = true;
      };
      plugins = [
        pkgs.vimPlugins.fzf-vim
      ];
      extraConfig = ''
        filetype plugin indent on
        syntax on
        set ruler
      '';
    };

    programs.git = {
      enable = true;
      userName = "James Mead";
      userEmail = "james@floehopper.org";

      aliases = {
        st = "status -sb";
        ci = "commit -v";
        co = "checkout";
        cp = "cherry-pick";
        br = "branch";
        rb = "rebase";
        lg = "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --";
      };

      attributes = [
        # From https://www.kernel.org/pub/software/scm/git/docs/gitattributes.html#_defining_a_custom_hunk_header
        "*.cpp diff=cpp"
        "*.html diff=html"
        "*.java diff=java"
        "*.m diff=objc"
        "*.pl diff=perl"
        "*.php diff=php"
        "*.py diff=python"
        "*.rb diff=ruby"
        "*.rake diff=ruby"
        "*.tex diff=tex"
      ];

      ignores = [
        # for vim
        "*.swp"

        # for local to-do lists
        "TODO"
        "TODO.md"

        # for OSX
        ".DS_Store"

        # for VS Code
        ".vscode/settings.json"

        # for brew bundle
        ".Brewfile"
        ".Brewfile.lock.json"

        # for zed editor
        ".zed/"
      ];

      extraConfig = {
        core = {
          editor = "vim";
          # Use built-in MacOS ssh binary to support UseKeychain directive in SSH config
          sshCommand = "/usr/bin/ssh";
        };

        init = {
          defaultBranch = "main";
        };

        branch = {
          autosetuprebase = "always";
        };

        push = {
          # push the current branch back to the tracked/upstream branch
          # but refuse to push if the upstream branch’s name is different from the local one
          default = "simple";
          autoSetupRemote = true;
        };

        rebase = {
          # allow fixup & squash commits
          autosquash = true;

          # this means that you can run rebase on a dirty worktree
          autostash = true;

          # rebase dependent branches
          updateRefs = true;
        };

        pull = {
          # rebase using git rebase --rebase-merges so that the local merge commits are included in the rebase
          rebase = "merges";
        };

        commit = {
          # display diff in commit editor
          verbose = true;
        };

        merge = {
          # in merge conflicts show original source as well as changes by both sides
          conflictstyle = "zdiff3";
        };

        status = {
          # when using `git status` & `git commit` show individual files in untracked directories
          showUntrackedFiles = "all";
        };

        pager = {
          branch = false;
          stash = false;
        };

        help = {
          autoCorrect = "prompt";
        };

        # 1Password-based config for signing git commits
        # See https://developer.1password.com/docs/ssh/git-commit-signing
        user = {
          signingkey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJXhBL4fySxImt3eVqEFaCuJTNu8V8+FqkOBvY3GQggj";
        };

        gpg = {
          format = "ssh";
          ssh.program = "/Applications/1Password.app/Contents/MacOS/op-ssh-sign";
        };

        commit = {
          gpgsign = true;
        };

        rerere = {
          enabled = true;
        };

        diff = {
          algorithm = "histogram";
        };
      };

      includes = [
        {
          condition = "gitdir:${userHome}/Code/nestauk/";
          path = "${userHome}/.config/git/nestauk.inc";
        }
        {
          condition = "gitdir:${userHome}/Code/rpf/";
          path = "${userHome}/.config/git/rpf.inc";
        }
      ];
    };
  };

  # Allow packages to be built on architecture provided by Rosetta 2
  # See https://github.com/LnL7/nix-darwin/issues/334#issue-904808659
  nix.extraOptions = ''
    extra-platforms = x86_64-darwin aarch64-darwin
    experimental-features = nix-command flakes
  '';



  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = [];

  # Use a custom configuration.nix location.
  # $ darwin-rebuild switch -I darwin-config=$HOME/.config/nixpkgs/darwin/configuration.nix
  # environment.darwinConfig = "$HOME/.config/nixpkgs/darwin/configuration.nix";

  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;
  # nix.package = pkgs.nix;

  # Create /etc/zshrc that loads the nix-darwin environment.
  programs.zsh.enable = true;  # default shell on MacOS since Catalina
  # programs.fish.enable = true;

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;

  system.defaults = {
    NSGlobalDomain = {
      InitialKeyRepeat = 15; # slider values 120, 94, 68, 35, 25, 15 (default 25)
      KeyRepeat = 2; # slider values 120, 90, 60, 30, 12, 6, 2 (default 6)
    };
  };
}
