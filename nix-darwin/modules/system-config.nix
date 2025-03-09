{ self, nixpkgs, ... }: {

  ############### Mac configuration ###############
  # System configuration
  ###########################################
  environment.variables = { EDITOR = "vim"; };

  # touchid for sudo authentication
  security.pam.services.sudo_local.touchIdAuth = true;

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

  ############### NIX Config ###############
  # Configuration for nix
  ###########################################
  nixpkgs = {
    hostPlatform = "aarch64-darwin";
    config.allowUnfree = true;
  };

  # Necessary for using flakes on this system.
  nix.settings.experimental-features = "nix-command flakes";
  # Set Git commit hash for darwin-version.
  system.configurationRevision = self.rev or self.dirtyRev or null;

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 5;
}
