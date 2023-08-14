#!/bin/bash

cd ~/ArchOs/Dotfiles
stow --target ~/ */
bat cache --build
sudo stow --target / pacman
