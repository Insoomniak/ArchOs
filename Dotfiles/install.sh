#!/bin/bash

cd ~/ArchOs/Dotfiles

rm -rf ~/.ssh
stow --target ~/ ssh
# Unmount and Mount Ventoy USB to get SSHKEYPrivate
sudo umount -f /mnt/Ventoy
sudo mkdir /mnt/Ventoy
sudo mount /dev/sdb1 /mnt/Ventoy
sudo cp /mnt/Ventoy/SSH/SSHKey-Dev-Private /home/dev/.ssh/
sudo chown dev /home/dev/.ssh/SSHKey-Dev-Private
chmod 600 /home/dev/.ssh/SSHKey-Dev-Private

rm -rf ~/.config/hypr
stow --target ~/ hyprland

rm -rf ~/.config/fish
stow --target ~/ fish

rm -rf ~/.config/kitty
stow --target ~/ kitty

rm -rf ~/.config/waybar
stow --target ~/ waybar

rm -rf ~/.config/starship
stow --target ~/ starship

rm -rf ~/.config/nvim
stow --target ~/ nvim



#stow --target ~/ */
#bat cache --build
#sudo rm -rf /etc/pacman.conf
#sudo stow --target / pacman
#stow --target ~/ ssh
