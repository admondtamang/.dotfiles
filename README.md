# Dotfiles

The configurations are managed by nix-darwin. so you can use the following command to install all configurations

## To get overview of whole configurations (Get a sneak peek)

https://github.com/admondtamang/dotfiles/blob/main/.config/nix-darwin/flake.nix

## Installation

```sh
git clone https://github.com/admondtamang/dotfiles.git ~
```

install darwin-nix and use the following command to install all configurations

```sh
darwin-rebuild switch --flake ~/dotfiles/nix-darwin
```

## Insights of this dotfiles

- I use [nix-darwin](https://daiderd.com/nix-darwin/manual/index.html) to manage my system configurations

## Packages

GUI apps are installed using [homebrew](https://brew.sh/)
CLI apps are installed using [nix](https://nixos.org/manual/nix/stable/)
