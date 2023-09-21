#This script build the custom iso from the archiso
#It add ScriptAdedToIso.sh to the iso

#!/bin/zsh

# Copy archiso files
sudo pacman --noconfirm --needed -Syu archiso
sudo cp -r /usr/share/archiso/configs/releng/ ./isoBuilder && sudo chmod -R 777 ./isoBuilder
sudo cp ./configFiles/sbat.csv ./usr/share/grub/
# Add config files to iso
cp ./configFiles/profiledef.sh ./isoBuilder/
cp ./configFiles/.zlogin ./isoBuilder/airootfs/root/
cp ./configFiles/mkinitcpio.conf ./isoBuilder/airootfs/etc/mkinitcpio.conf
cp ./configFiles/packages.x86_64 ./isoBuilder/
# Add ArchOs folder to iso
git clone https://github.com/Insoomniak/ArchOs.git ./isoBuilder/airootfs/root/ArchOs
# Build iso
StartTime=$(date +%s)
sudo mkarchiso -v ./isoBuilder/
EndTime=$(date +%s)
# Moove iso do Downloads folder and clean temp files
sudo chmod -R 777 ./out ./work
rm -rf /home/dev/Downloads/ArchOsCustom.iso
mv ./out/ArchOsCustom--x86_64.iso /home/dev/Downloads/ArchOsCustom.iso
rm -rf ./isoBuilder ./work ./out

echo "------------------------------------"
echo "Iso builded in $((EndTime - StartTime)) seconds"
echo "Iso mooved in ~/Downloads/"
echo "------------------------------------"
# Prompt to launch ArchOs iso test now
while true; do
    read -p "Do you whant to launch the ArchOs iso tester now? (y/n) " yn
    case $yn in
        [Yy]* ) run_archiso -u -i ~/Downloads/ArchOsCustom.iso; break;;
        [Nn]* ) exit;;
        * ) echo "Please choose (y) or (n).";;
    esac
done
