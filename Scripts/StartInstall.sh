# Script to start the Arch Linux installation
#!/bin/bash

cd /root/ArchOs
# Set the keyboard layout
loadkeys us
# set TimeZone
timedatectl set-timezone Europe/Paris
timedatectl set-ntp true
# Start Archinstall with configs files
archinstall --config ./Scripts/user_configuration.json --creds ./Scripts/user_credentials.json
# execute chroot script
cp -R /root/ArchOs /mnt/archinstall/root/
arch-chroot /mnt/archinstall /root/ArchOs/Scripts/ChrootActions.sh
# move the ArchOs folder to the home dev folder
mv /mnt/archinstall/root/ArchOs/Scripts/PostInstall.sh /mnt/archinstall/home/dev/
# reboot
echo "Installation finished. Please reboot and launch PostInstall.sh."

