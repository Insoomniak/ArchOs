#!/bin/bash

mkdir ~/Downloads ~/Workspace ~/Scripts ~/Medias ~/Trash
cd ~/Trash
# Install chaotic-aur
sudo pacman-key --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com
sudo pacman-key --lsign-key 3056513887B78AEB
sudo pacman --noconfirm -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst' 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'
sudo cp ~/ArchOs/Dotfiles/pacman/etc/pacman.conf /etc/
sudo pacman --noconfirm -Syu
# Install packages
sudo pacman --noconfirm --needed -S \
# powerline-fonts make pip cargo python nodejs npm docker \
# nano stow btop git gitui neofetch \
# bat exa ranger fd ripgrep fzf zoxide unrar \
# hyprland eww-wayland  \
# fish alacritty kitty \
# neovim brave \
hyprland kitty

# Setup dotfiles
~/ArchOs/Dotfiles/install.sh

git config --global user.name "Dev"
git config --global user.email "houdeyer.julien@gmail.com"


