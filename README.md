# Dotfiles

The configurations are managed by nix-darwin. so you can use the following command to install all configurations


## Installation

```sh
git clone https://github.com/admondtamang/dotfiles.git ~
```

install darwin-nix and use the following command to install all configurations


### Mac only

## To get overview of whole configurations (Get a sneak peek)

https://github.com/admondtamang/dotfiles/blob/main/nix-darwin/flake.nix

## installation
```sh
darwin-rebuild switch --flake ~/projects/_personal/dotfiles/nix-darwin
```

## Insights of this dotfiles

- I use [nix-darwin](https://daiderd.com/nix-darwin/manual/index.html) to manage my system configurations

## Packages

GUI apps are installed using [homebrew](https://brew.sh/)
CLI apps are installed using [nix](https://nixos.org/manual/nix/stable/)

=================================================


## STOW
Run stow to symlink everything or just select what you want

```
stow */  # For Everything
```
```
stow nvim # Only nvim config
stow -D . # Remove everything
stow -D nvim # Remove nivm config
```

# Useful sites

| Task | URL |
| --- | --- |
| compress | https://www.iloveimg.com/ |
| favicon generator | https://favicon.io/ |
| table to csv and more conversion | https://tableconvert.com/ |
| purchase domain | https://porkbun.com/ |
| a fake SMTP service | https://ethereal.email |
|Ventory: for creating bootable disk | https://www.ventoy.net/en/index.html|
| Temporary phone number | https://temp-number.com|
| Docuseal | https://www.docuseal.com |
| tunnel - ngrok alternative - pinggy | [https://tunnelmole.com/](https://pinggy.io) |


# Packages for doing shits

| Task | Package | site |
| --- | --- | --- |
| framework | Nextjs,Vite |  |
| alert | Sonner |  |
| api | axios with tankstack react query |  |
| form | react hook form with zod |  |
| table | tankstack react table |  |
| Global state manager | zustand |  |
| ui | shadcn |  |
| charts | recharts |  |
| Carousel | swiper | https://swiperjs.com/react |
| animation | framer motion |  |
| date and time | date-fns |  |
| markdown editor | react-quill |  |
| next js router events | nextjs-router-events | https://github.com/run4w4y/nextjs-router-events|

```
```
