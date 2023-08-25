#qmk setup script to build new firmware using docker


#!/bin/bash
# Clone the qmk repo only if it doesn't exist
if [ ! -d "qmk" ]; then
  qmk setup
fi

# qmk new-keymap -kb $keyboard -km $layout
# rm -rf qmk/keyboards/ferris/keymaps/custom_keymap
# cp -r ./custom_keymap qmk/keyboards/ferris/keymaps/

echo "Please plug in left side of keyboard and press enter"
read -p ""
qmk flash -kb ferris/sweep -km via -e CONVERT_TO=liatris -bl uf2-split-left
echo "Please plug in right side of keyboard and press enter"
read -p ""
qmk  -kb ferris/sweep -km via -e CONVERT_TO=liatris -bl uf2-split-right

