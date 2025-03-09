{
  ############### Overview ###############
  # darwin-rebuild switch --flake ~/dotfiles/nix-darwin
  ###########################################

  description = "nix-darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nix-darwin, nixpkgs, home-manager, ... }@inputs: {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#admonds-MacBook-Air
    darwinConfigurations."admonds-MacBook-Air" = nix-darwin.lib.darwinSystem {
      system = "x86_64-darwin";
      modules = [
        ./modules/system-config.nix
        ./modules/homebrew.nix
        home-manager.darwinModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.admondtamang = import ./modules/programs.nix;

          # Optionally, use home-manager.extraSpecialArgs to pass
          # arguments to home.nix
        }
      ];
      specialArgs = { inherit self inputs; };
    };
    # Expose the package set, including overlays, for convenience.
    darwinPackages = self.darwinConfigurations."admondtamang".pkgs;
  };

}
