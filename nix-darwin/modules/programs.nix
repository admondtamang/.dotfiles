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
    # Utilities
    doctl # digital ocean cli
    kubectl # kubernetes cli
    kubernetes-helm # kubernetes package manager
    datree # kubernetes security scanner
    sshs # ssh client for terminal
    stow # symlink manager
    tree # directory tree
    nmap # network scanner
    php # php interpreter
    wget # wget

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

  programs.fish = {
    enable = true;
    shellInit = ''
      starship init fish | source
      thefuck --alias | source
    '';
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
  home.stateVersion = "24.11";
  home.sessionPath = [ "/run/current-system/sw/bin" "$HOME/.nix-profile/bin" ];
  programs.home-manager.enable = true;

}
