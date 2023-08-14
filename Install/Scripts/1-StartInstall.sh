# Script to start the Arch Linux installation
#!/bin/bash

# Set the keyboard layout
loadkeys us
# set TimeZone
timedatectl set-timezone Europe/Paris
timedatectl set-ntp true
# Start Archinstall with configs files
archinstall --config ./Scripts/user_configuration.json --creds ./Scripts/user_credentials.json
# execute chroot script
mv ArchOs/Install/Scripts/2-ChrootActions.sh /mnt/archinstall/root/
arch-chroot /mnt/archinstall /root/2-ChrootActions.sh
rm /mnt/archinstall/root/2-ChrootActions.sh
# add GetArchOsRepo script in /home/dev
mv ArchOs/Install/Scripts/0-GetArchOsRepo.sh /mnt/archinstall/home/dev/
# echo "echo 'Please run ArchOs/Install/Script/3-PostInstall.sh'" >> /mnt/archinstall/home/dev/0-GetArchOsRepo.sh
# reboot
echo "Installation finished. Please reboot and launch GetArchOsRepo.sh."

