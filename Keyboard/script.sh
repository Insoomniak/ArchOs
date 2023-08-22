#qmk setup script

#!/bin/bash
sudo pacman -S --noconfirm --needed docker

git clone --recurse-submodules https://github.com/qmk/qmk_firmware.git qmk
cd qmk
