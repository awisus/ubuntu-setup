#!/bin/bash

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/JetBrains/JetBrainsMono/master/install_manual.sh)"

mkdir -p $HOME/.fonts
rm -rf $HOME/.fonts/fira
cp -r fonts/fira $HOME/.fonts/fira
rm -rf $HOME/.fonts/roboto-slab
cp -r fonts/roboto-slab $HOME/.fonts/roboto-slab

gsettings set org.gnome.desktop.interface font-name 'Fira Sans Book 10'
gsettings set org.gnome.desktop.interface document-font-name 'Roboto Slab Regular 11'
gsettings set org.gnome.desktop.interface monospace-font-name 'Jetbrains Mono Medium 10'
gsettings set org.gnome.desktop.wm.preferences titlebar-font 'Fira Sans SemiBold 10'
