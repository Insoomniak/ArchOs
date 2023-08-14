#!/bin/bash

cd ~/ArchOs/Dotfiles
pwd
stow --target ~/ */
bat cache --build
