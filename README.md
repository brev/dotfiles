# Dotfiles

## Symlinks

Run `./link.sh` script to install symlinks from `$PWD` into your `$HOME` 
directory.

```sh
git clone https://github.com/tarjoilija/zgen.git "${HOME}/.zgen"

cd src/@brev/
git clone https://github.com/brev/dotfiles.git
cd dotfiles/
./link.sh
```

## Packages

Global manifests for varying package managers are in `./packages`.
