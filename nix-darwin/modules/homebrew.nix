{ ... }: {

  ############### Homebrew ###############
  # Packages for GUI application
  ###########################################
  # Homebrew needs to be installed on its own!
  homebrew = {
    enable = true;

    onActivation = {
      autoUpdate = true;
      cleanup = "uninstall";
    };
    casks = [
      "warp" # terminal
      "raycast"
      "hoppscotch"
      "spotify"
      "whatsapp"
      "slack"
      "caido" # pentest tool
      "dbeaver-community" # database tool
      "linearmouse" # mouse tool
      "vivaldi"
      # "kitty" 
    ];
  };
}
