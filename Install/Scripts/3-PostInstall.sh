#!/bin/bash

mkdir ~/Downloads ~/Workspace ~/Scripts ~/Medias ~/Trash
cd ~/Trash
# Install yay package manager
git clone https://aur.archlinux.org/yay.git
cd yay && makepkg -si --noconfirm
# Install packages
yay -S --noconfirm --needed \
powerline-fonts make pip cargo python nodejs npm docker \
nano stow btop git gitui neofetch \
bat exa ranger fd ripgrep fzf zoxide unrar \
hyprland eww-wayland  \
fish alacritty kitty \
neovim brave \

git config --global user.name "Dev"
git config --global user.email "houdeyer.julien@gmail.com"

~/ArchOs/Dotfiles/install.sh

