#!/bin/sh

# Set the keyboard layout
loadkeys us
# set TimeZone
timedatectl set-timezone Europe/Paris
timedatectl set-ntp true
# Add Chaotic-AUR repo
pacman-key --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com
pacman-key --lsign-key 3056513887B78AEB
pacman --noconfirm -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst' 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'
cp ~/ArchOs/Dotfiles/pacman/etc/pacman.conf /etc/
pacman --noconfirm -Syu

echo "------------------------------------"
echo "Chaotic-AUR repo added to pacman.conf"
echo "------------------------------------"

