#!/bin/bash

sudo apt install -y fonts-firacode fonts-roboto-slab

sudo cp -r \
    fonts/fira \
    /usr/share/fonts/opentype
sudo cp -r \
    fonts/firacode-nerd-font \
    /usr/share/fonts/truetype

gsettings set org.gnome.desktop.interface font-name 'Fira Sans Book 10'
gsettings set org.gnome.desktop.interface document-font-name 'Roboto Slab Regular 11'
gsettings set org.gnome.desktop.interface monospace-font-name 'FiraCode Nerd Font Medium 11'
gsettings set org.gnome.desktop.wm.preferences titlebar-font 'Fira Sans SemiBold 10'
