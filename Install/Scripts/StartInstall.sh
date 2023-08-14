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
mv ArchOs/Install/Scripts/ChrootActions.sh /mnt/archinstall/root/
arch-chroot /mnt/archinstall /root/ChrootActions.sh
rm /mnt/archinstall/root/ChrootActions.sh
# add GetArchOsRepo script in /home/dev
echo "
#!/bin/bash
cd ~ && rm -rf ArchOs && git clone https://github.com/Insoomniak/ArchOs.git
echo "Please launch ArchOs/Install/Scripts/PostInstall.sh."
" >> /mnt/archinstall/home/dev/GetArchOsRepo.sh
chmod 777 /mnt/archinstall/home/dev/GetArchOsRepo.sh
# reboot
echo "Installation finished. Please reboot and launch GetArchOsRepo.sh."

