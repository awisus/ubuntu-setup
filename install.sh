#!/bin/bash

# config
cp config/hidden $HOME/.hidden
cp config/zshrc  $HOME/.zshrc

bash fonts/fonts.sh

gsettings set org.gnome.shell.app-switcher current-workspace-only      true

gsettings set org.gnome.shell.extensions.desktop-icons show-home       false
gsettings set org.gnome.shell.extensions.desktop-icons show-trash      false

gsettings set org.gnome.shell.extensions.dash-to-dock dock-fixed       false
gsettings set org.gnome.shell.extensions.dash-to-dock extend-height    false
gsettings set org.gnome.shell.extensions.dash-to-dock click-action     'minimize'
gsettings set org.gnome.shell.extensions.dash-to-dock show-trash       true
gsettings set org.gnome.shell.extensions.dash-to-dock intellihide-mode 'FOCUS_APPLICATION_WINDOWS'
gsettings set org.gnome.shell.extensions.dash-to-dock scroll-action    'cycle-windows'

echo fs.inotify.max_user_watches=524288 >> /etc/sysctl.conf
echo vm.swappiness = 10                 >> /etc/sysctl.conf
sudo sysctl -p

sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker

# autostart
mkdir -p       $HOME/.config/autostart
cp autostart/* $HOME/.config/autostart

# apps
sudo apt update
sudo apt dist-upgrade -y

sudo snap set system refresh.retain=2
sudo snap install --classic \
     android-studio
sudo snap install --classic \
     intellij-idea-ultimate
sudo snap install --classic \
     heroku

sudo apt install -y \
     curl \
     dconf-editor \
     default-jdk \
     docker.io \
     docker-compose \
     exfat-fuse \
     exfat-utils \
     gimp \
     git \
     gnome-tweak-tool \
     guake \
     keepassxc \
     seahorse \
     seahorse-nautilus \
     thunderbird \
     ttf-mscorefonts-installer

bash apps/code.sh
bash apps/gitkraken.sh
bash apps/insomnia.sh

bash tools/flutter.sh
bash tools/node.sh
bash tools/ruby.sh
bash tools/zsh.sh

# git
git config --global color.ui true
git config --global user.name "Jens Awisus"
git config --global user.email "awisus.jens@gmail.com"

exec $SOURCE

# dock
gsettings set org.gnome.shell favorite-apps "['org.gnome.Nautilus.desktop', 'org.gnome.Terminal.desktop', 'thunderbird.desktop', 'firefox.desktop', 'intellij-idea-ultimate_intellij-idea-ultimate.desktop', 'gitkraken.desktop', 'insomnia.desktop', 'keepassxc.desktop']"

# manual steps
echo "Installation abgeschlossen!"
echo "Noch zu installieren: pcloud"
