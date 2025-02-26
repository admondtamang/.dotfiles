{
  ############### Overview ###############
  # darwin-rebuild switch --flake ~/dotfiles/.config/nix-darwin
  ###########################################

  description = "nix-darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nix-darwin, nixpkgs, ... }@inputs: {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#admonds-MacBook-Air
    darwinConfigurations."admonds-MacBook-Air" = nix-darwin.lib.darwinSystem {
      modules = [
        ./modules/programs.nix
        ./modules/system-config.nix
        ./modules/homebrew.nix
      ];
      specialArgs = { inherit self inputs; };
    };
    # Expose the package set, including overlays, for convenience.
    darwinPackages = self.darwinConfigurations."admond".pkgs;
  };

}
