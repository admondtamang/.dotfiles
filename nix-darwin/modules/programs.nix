{ pkgs, lib, ... }: {

  home.username = "admondtamang";
  home.homeDirectory = lib.mkForce "/Users/admondtamang";

  ############### Program configuration ###############
  # Package level config
  ###########################################

  # Fonts
  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    fira-code

    #Shells and editors
    vim
    btop
    fish
    neovim
    eza
    thefuck
    starship
    tmux

    #DEV
    nodejs_20
    bun
    python313
    git
    gh
    ngrok
    go
    delve
    air
    sqlc
    delta
    mariadb

    # Utilities
    doctl # digital ocean cli
    kubectl # kubernetes cli
    k9s
    kubernetes-helm # kubernetes package manager
    datree # kubernetes security scanner
    fzf
    sshs # ssh client for terminal
    stow # symlink manager
    tree # directory tree
    nmap # network scanner
    php # php interpreter
    wget # wget
    nuclei
    kubectx
    # NPM Tools
    nodePackages.serve
    nodePackages.yarn
    nodePackages.ts-node
    nodePackages.typescript

    # Hacking
    wpscan

    # Nix
    nixfmt-classic
  ];

  home.stateVersion = "24.11";
  home.sessionPath = [ "/run/current-system/sw/bin" "$HOME/.nix-profile/bin" ];
  programs.home-manager.enable = true;
}
