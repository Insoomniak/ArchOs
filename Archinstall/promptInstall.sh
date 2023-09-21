#!/bin/bash
#Prompt user to start ArchOs installation at startup

clear
cd
while true; do
    read -p "Do you whant to launch the ArchOs install script? (y/n) " yn
    case $yn in
        [Yy]* ) ./ArchOs/Archinstall/startInstall.sh; break;;
        [Nn]* ) exit;;
        * ) echo "Please choose (y) or (n).";;
    esac
done

