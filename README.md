# Dotfiles

The configurations are managed by nix-darwin. so you can use the following command to install all configurations

## To get overview of whole configurations (Get a sneak peek)

https://github.com/admondtamang/dotfiles/blob/main/.config/nix-darwin/flake.nix

## Installation

```sh
git clone https://github.com/admondtamang/dotfiles.git ~
```

then install stow (stow is a symlink manager which hard links files to the current directory)

```sh
brew install stow
stow .
```

install darwin-nix and use the following command to install all configurations

```sh
darwin-rebuild switch --flake ~/.config/nix-darwin
```

## Insights of this dotfiles

- I use [nix-darwin](https://daiderd.com/nix-darwin/manual/index.html) to manage my system configurations
- I use [stow](https://www.gnu.org/software/stow/) to manage symlinks

## Packages

GUI apps are installed using [homebrew](https://brew.sh/)
CLI apps are installed using [nix](https://nixos.org/manual/nix/stable/)
