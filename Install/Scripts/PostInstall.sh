#!/bin/bash

mkdir ~/Downloads ~/Workspace ~/Scripts ~/Medias ~/Trash
cd ~/Trash
# Install yay package manager
git clone https://aur.archlinux.org/yay.git
cd yay && makepkg -si --noconfirm
# Install packages
yay -S --noconfirm --needed \
nano stow \
hyprland eww-wayland  \
fish alacritty \
# neovim \

