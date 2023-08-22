#!/bin/bash

mkdir ~/Downloads ~/Workspace ~/Scripts ~/Medias ~/Trash
cd ~/Trash
# Install chaotic-aur
sudo pacman-key --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com
sudo pacman-key --lsign-key 3056513887B78AEB
sudo pacman --noconfirm -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst' 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'
sudo cp /home/dev/ArchOs/Dotfiles/pacman/etc/pacman.conf /etc/
sudo pacman --noconfirm -Syu
# Install packages
sudo pacman --noconfirm --needed -S \
openssh make cargo python nodejs npm docker\
nano stow btop git gitui neofetch \
bat exa ranger fd ripgrep fzf zoxide unrar \
hyprland waybar-hyprland-git eww-wayland  \
fish starship alacritty kitty ttf-firacode-nerd powerline-fonts \
neovim brave \


# Unmount and Mount Ventoy USB to get SSHKEYPrivate
sudo umount -f /mnt/Ventoy
sudo mkdir /mnt/Ventoy
sudo mount /dev/sdb1 /mnt/Ventoy
cp -r ~/ArchOs/Dotfiles/ssh/.ssh ~/
sudo cp /mnt/Ventoy/SSH/SSHKey-Dev-Private /home/dev/.ssh/
sudo chown dev /home/dev/.ssh/SSHKey-Dev-Private
chmod 600 /home/dev/.ssh/SSHKey-Dev-Private

# Delete copy of ArchOs folder to clone it with ssh
cd ~
rm -rf ./ArchOs
git clone git@github.com:Insoomniak/ArchOs.git

# Setup dotfiles
~/ArchOs/Dotfiles/install.sh

git config --global user.name "Dev"
git config --global user.email "houdeyer.julien@gmail.com"


