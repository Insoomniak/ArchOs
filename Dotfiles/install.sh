#!/bin/bash

cd ~/ArchOs/Dotfiles
stow --target ~/ */
bat cache --build
sudo rm -rf /etc/pacman.conf
sudo stow --target / pacman
