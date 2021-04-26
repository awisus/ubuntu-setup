#!/bin/bash

sudo apt install -y fonts-firacode

sudo cp -r \
    fonts/fira \
    /usr/share/fonts/opentype
sudo cp -r \
    fonts/roboto-slab \
    /usr/share/fonts/truetype

gsettings set org.gnome.desktop.interface font-name 'Fira Sans Book 10'
gsettings set org.gnome.desktop.interface document-font-name 'Roboto Slab Regular 11'
gsettings set org.gnome.desktop.interface monospace-font-name 'Fira Code Retina 11'
gsettings set org.gnome.desktop.wm.preferences titlebar-font 'Fira Sans SemiBold 10'
