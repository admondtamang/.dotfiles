{
  ############### Overview ###############
  # darwin-rebuild switch --flake ~/.config/nix-darwin
  ###########################################

  description = "nix-darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs }:
    let
      configuration = { pkgs, ... }: {
        environment.systemPackages = with pkgs; [

          #Shells and editors
          vim
          btop
          fish
          neovim
          eza

          #DEV
          nodejs_20
          bun
          python3
          git
          gh
          ngrok
          go
          air

          # Utilities
          doctl # digital ocean cli
          kubectl # kubernetes cli
          kubernetes-helm # kubernetes package manager
          datree # kubernetes security scanner
          sshs # ssh client for terminal
          stow # symlink manager
          tree # directory tree

          # NPM Tools
          nodePackages.serve
          nodePackages.yarn

          # Hacking
          wpscan
          metasploit

          # Nix
          nixfmt-classic
        ];

        programs.fish = {
          enable = true;
          shellAliases = {
            ls = "eza ";
            ll = "eza -l --color=always";
            la = "eza -a --color=always";
            lla = "eza -al --color=always";
            ".." = "cd ..";
            "..." = "cd ../..";
            "...." = "cd ../../..";
            ".2" = "cd ../..";
            ".3" = "cd ../../..";
            ".4" = "cd ../../../..";
            ".5" = "cd ../../../../..";
            ".6" = "cd ../../../../../..";

            # Git aliases
            gs = "git status";
            ga = "git add";
            gc = "git commit";
            gph = "git push";
            gpl = "git pull";
            gco = "git checkout";
            glog = "git log --oneline --graph --decorate";
            gd = "git diff";

            # Kubernetes aliases
            k = "kubectl";
            ka = "kubectl apply";
            kd = "kubectl describe";
            kg = "kubectl get";
            kl = "kubectl logs";
            kx = "kubectl exec -it";

            v = "vim";
            vim = "nvim";
            vi = "nvim";
            vimdiff = "nvim -d";

            suspend = "systemctl suspend";
          };

        };

        environment.variables = { EDITOR = "vim"; };

        # touchid for sudo authentication
        security.pam.enableSudoTouchIdAuth = true;

        # docs: https://daiderd.com/nix-darwin/manual/index.html
        system.defaults = {
          dock = {
            autohide = true;
            magnification = true;
            mru-spaces = false;
            tilesize = 32;
            largesize = 96;
          };

          finder = {
            AppleShowAllExtensions = true;
            FXPreferredViewStyle = "clmv"; # column view
            FXDefaultSearchScope = "SCcf"; # default fodler
            ShowPathbar = true;
          };

          trackpad = {
            # tap to click
            Clicking = true;
            # tap-tap-drag to drag
            Dragging = true;
            # two-finger-tap right click
            TrackpadRightClick = true;
          };

          NSGlobalDomain = { "com.apple.mouse.tapBehavior" = 1; };

          loginwindow.LoginwindowText = "Hello world!";
          screencapture.location = "~/Pictures/screenshots";
          screensaver.askForPasswordDelay = 10;
        };

        # Homebrew needs to be installed on its own!
        homebrew = {
          enable = true;

          onActivation = {
            autoUpdate = true;
            cleanup = "uninstall";
          };
          casks = [
            "warp"
            "raycast"
            "hoppscotch"
            "spotify"
            "firefox"
            "ghostty"
            "whatsapp"
            "slack"
            "msty"
            "caido"
          ];
        };

        ############### NIX Config ###############
        # Configuration for nix
        ###########################################

        nixpkgs.config.allowUnfree = true;

        # Necessary for using flakes on this system.
        nix.settings.experimental-features = "nix-command flakes";
        # Set Git commit hash for darwin-version.
        system.configurationRevision = self.rev or self.dirtyRev or null;

        # Used for backwards compatibility, please read the changelog before changing.
        # $ darwin-rebuild changelog
        system.stateVersion = 5;

        # The platform the configuration will be used on.
        nixpkgs.hostPlatform = "aarch64-darwin";
      };
    in {
      # Build darwin flake using:
      # $ darwin-rebuild build --flake .#admonds-MacBook-Air
      darwinConfigurations."admonds-MacBook-Air" =
        nix-darwin.lib.darwinSystem { modules = [ configuration ]; };
    };
}
