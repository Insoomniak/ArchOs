#qmk setup script to build new firmware using docker


#!/bin/bash
# Clone the qmk repo only if it doesn't exist
if [ ! -d "qmk" ]; then
  qmk setup
fi

# Select VIA or default or customKeymap
KEYMAP="customKeymap"
# KEYMAP="via"
# KEYMAP="default"

# qmk new-keymap -kb $keyboard -km $layout
rm -rf qmk/keyboards/ferris/keymaps/customKeymap
cp -r ./customKeymap qmk/keyboards/ferris/keymaps/

echo "Please plug in left side of keyboard and press enter"
read -p ""
qmk flash -kb ferris/sweep -km $KEYMAP -bl uf2-split-left
echo "Please plug in right side of keyboard and press enter"
read -p ""
qmk flash -kb ferris/sweep -km $KEYMAP -bl uf2-split-right
#
# echo "Please plug in left side of keyboard with trrs jack connected and press enter"
# read -p ""
# qmk flash -kb ferris/sweep -km $KEYMAP -e CONVERT_TO="liatris"
