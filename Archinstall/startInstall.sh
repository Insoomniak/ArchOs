#!/bin/bash
#Prompt user to start ArchOs installation at startup

clear
cd
while true; do
    read -p "Do you whant to launch the ArchOs install script? (y/n) " yn
    case $yn in
        [Yy]* ) echo "Starting installation" ; break;;
        [Nn]* ) exit;;
        * ) echo "Please choose (y) or (n).";;
    esac
done

# Set the keyboard layout
loadkeys us
# set TimeZone
timedatectl set-timezone Europe/Paris
timedatectl set-ntp true
# Start Archinstall tool with config files
cd ~/ArchOs/
archinstall --config ./configFiles/user_configuration.json --creds ./configFiles/user_credentials.json
# Move ChrootActions.sh in /root of the new system
mv ./Archinstall/configFiles/ChrootActions.sh /mnt/archinstall/root/
# Launch 2-ChrootActions.sh
arch-chroot /mnt/archinstall /root/ChrootActions.sh
rm /mnt/archinstall/root/ChrootActions.sh
