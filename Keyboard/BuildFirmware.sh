#qmk setup script to build new firmware using docker


#!/bin/bash

# Change these to your keyboard and layout
keyboard="ferris/sweep"
layout="default"
converter="liatris"
 # make CONVERT_TO=kb2040 ferris/sweep:default:uf2-split-left
# make CONVERT_TO=kb2040 ferris/sweep:default:uf2-split-right
sudo pacman -S --noconfirm --needed docker

# Clone the qmk repo only if it doesn't exist
if [ ! -d "qmk" ]; then
    git clone --recurse-submodules https://github.com/qmk/qmk_firmware.git qmk
fi

cd qmk

# Change the builder to include the converter
FILE_NAME="./util/docker_build.sh"
OLD_STRING='make "$keyboard${keymap:+:$keymap}${target:+:$target}"'
NEW_STRING='make CONVERT_TO='$converter' "$keyboard${keymap:+:$keymap}${target:+:$target}"'
sed -i "s|${OLD_STRING}|${NEW_STRING}|" $FILE_NAME











# Build the firmware
./util/docker_build.sh $keyboard:$layout

# Restore the builder
sed -i "s|${NEW_STRING}|${OLD_STRING}|" $FILE_NAME
