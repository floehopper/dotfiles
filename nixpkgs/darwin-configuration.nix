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
    home.stateVersion = "22.11";

    home.homeDirectory = userHome;

    home.sessionVariables = {
      EDITOR = "vim";
      LESS = "-R"; # Prevent less from escaping xterm color control chars that appear in Rails log file
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

    home.file."${userHome}/.config/git/dxw.inc".text = ''
      [user]
        email = "james.mead+dxw@gofreerange.com"
    '';

    home.file."${userHome}/.config/git/gds.inc".text = ''
      [user]
        email = "james.mead@digital.cabinet-office.gov.uk"
    '';

    # Assumes 1Password is installed with its SSH Agent
    # See https://developer.1password.com/docs/ssh/agent
    home.file."${userHome}/.1password/agent.sock".source = config.lib.file.mkOutOfStoreSymlink "${userHome}/Library/Group\ Containers/2BUA8C4S2C.com.1password/t/agent.sock";

    programs.zsh = {
      enable = true;
      oh-my-zsh = {
        enable = true;
        plugins = [ "git-prompt" ];
      };
      envExtra = ''
      '';
      initExtra = ''
        /usr/bin/ssh-add --apple-use-keychain ${userHome}/.ssh/id_ed25519
        export PATH=$PATH:${userHome}/govuk/govuk-docker/exe
        . /opt/homebrew/opt/asdf/libexec/asdf.sh
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
        HostkeyAlgorithms +ssh-rsa
        PubkeyAcceptedAlgorithms +ssh-rsa
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

        # for asdf
        ".tool-versions"
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
        };

        pull = {
          # rebase branches on top of the fetched branch
          # locally committed merge commits will not be flattened by running `git pull`
          rebase = "preserve";
        };

        commit = {
          # display diff in commit editor
          verbose = true;
        };

        merge = {
          # in merge conflicts show original source as well as changes by both sides
          conflictstyle = "diff3";
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
          autoCorrect = 0;
        };
      };

      includes = [
        {
          condition = "gitdir:${userHome}/Code/dxw/";
          path = "${userHome}/.config/git/dxw.inc";
        }
        {
          condition = "gitdir:${userHome}/govuk/";
          path = "${userHome}/.config/git/gds.inc";
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

  # Create /etc/bashrc that loads the nix-darwin environment.
  programs.zsh.enable = true;  # default shell on catalina
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
