#!/bin/bash
#Prompt user to start ArchOs installation at startup

clear
cd
while true; do
    read -p "Do you whant to launch the ArchOs install script? (y/n) " yn
    case $yn in
        [Yy]* ) ; break;;
        [Nn]* ) exit;;
        * ) echo "Please choose (y) or (n).";;
    esac
done

# Set the keyboard layout
loadkeys us
# set TimeZone
timedatectl set-timezone Europe/Paris
timedatectl set-ntp true
cd ~/ArchOs/
python -m archinstall guided --profile ./archinstall.py
