#qmk setup script to build new firmware using docker


#!/bin/bash
# Clone the qmk repo only if it doesn't exist
if [ ! -d "qmk" ]; then
  qmk setup
fi

# qmk new-keymap -kb $keyboard -km $layout
rm -rf qmk/keyboards/ferris/keymaps/custom_keymap
cp -r ./custom_keymap qmk/keyboards/ferris/keymaps/
qmk compile -e CONVERT_TO=liatris -kb ferris/sweep -km custom_keymap
cp -r qmk/.build/ferris_sweep_custom_keymap_liatris.uf2 ./keyboardFirmware.uf2
rm -rf qmk/.build
echo "Firmware built and copied to keyboardFirmware.uf2"
echo "Press the reset button on the keyboard and copy the firmware to the keyboard"
