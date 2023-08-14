#!/bin/bash

cd ~/ArchOs/Dotfiles
stow --target ~/ */
bat cache --build
stow --target /etc/ pacman
