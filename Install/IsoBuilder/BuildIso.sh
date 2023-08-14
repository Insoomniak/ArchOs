#This script build the custom iso from the archiso
#It add ScriptAdedToIso.sh to the iso

#!/bin/zsh

StartTime=$(date +%s)

pacman --noconfirm --needed -Sy archiso
cp -r /usr/share/archiso/configs/releng/ ./ArchIsoSource
chmod -R 777 ./ArchIsoSource
cp ./files/GetArchOsRepo.sh ./ArchIsoSource/airootfs/root/
cp ./files/profiledef.sh ./ArchIsoSource/
cp ./files/mkinitcpio.conf ./ArchIsoSource/airootfs/etc/mkinitcpio.conf
cp ./files/packages.x86_64 ./ArchIsoSource/
cp ./files/pacman.conf ./ArchIsoSource/
mkarchiso -v -r ./ArchIsoSource/ -w ./temp/ -o .
chmod -R 777 ./out
mv ./out/ArchOsCustom--x86_64.iso /home/dev/Downloads/ArchOsCustom.iso
rm -rf ./ArchIsoSource ./temp ./out

EndTime=$(date +%s)

echo "------------------------------------"
echo "Iso builded in $((EndTime - StartTime)) seconds"
echo "Iso mooved in ~/Downloads/"
echo "------------------------------------"

