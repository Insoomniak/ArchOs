#This script is added to the iso at build time

#!/bin/bash
cd /root
rm -rf ArchOs
pacman -Sy --noconfirm --needed git
git clone https://github.com/Insoomniak/ArchOs.git
cd ArchOs/Install
./Scripts/StartInstall.sh
