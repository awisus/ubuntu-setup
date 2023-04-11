#!/bin/bash

# apps
sudo apt update
sudo apt dist-upgrade -y

sudo apt install -y \
     build-essential \
     curl \
     chromium-browser \
     deja-dup \
     dconf-editor \
     exfat-fuse \
     exfat-utils \
     gimp \
     git \
     gitg \
     gnome-tweaks \
     openjdk-11-jdk \
     openjdk-17-jdk \
     seahorse \
     seahorse-nautilus \
     ttf-mscorefonts-installer \
     snapd

sudo snap set system refresh.retain=2
sudo snap install --classic bitwarden
sudo snap install --classic intellij-idea-community
sudo snap install --classic heroku
sudo apt  install -y \
     chromium-browser \
     chromium-chromedriver

bash apps/code.sh
bash apps/insomnia.sh
bash apps/signal.sh

bash tools/docker.sh
bash tools/flutter.sh
bash tools/jenv.sh
bash tools/node.sh
bash tools/zsh.sh

# config
bash fonts/fonts.sh

mkdir -p android
mkdir -p flutter
cp config/hidden $HOME/.hidden
cp update.sh     $HOME/.local/bin/update
chmod +x         $HOME/.local/bin/update

gsettings set org.gnome.shell.app-switcher current-workspace-only              true

gsettings set org.gnome.shell.extensions.desktop-icons show-home               false
gsettings set org.gnome.shell.extensions.desktop-icons show-trash              false
gsettings set org.gnome.shell.extensions.ding show-home                        false
gsettings set org.gnome.shell.extensions.ding show-trash                       false

gsettings set org.gnome.shell.extensions.dash-to-dock dock-fixed               false
gsettings set org.gnome.shell.extensions.dash-to-dock extend-height            false
gsettings set org.gnome.shell.extensions.dash-to-dock click-action             'minimize'
gsettings set org.gnome.shell.extensions.dash-to-dock show-trash               true
gsettings set org.gnome.shell.extensions.dash-to-dock intellihide              true
gsettings set org.gnome.shell.extensions.dash-to-dock require-pressure-to-show false
gsettings set org.gnome.shell.extensions.dash-to-dock scroll-action            'cycle-windows'
gsettings set org.gnome.desktop.wm.preferences workspace-names                 "['Terminal', 'Kommunikation', 'Arbeit', 'Spiel']"

gsettings set org.gnome.shell favorite-apps "['org.gnome.Nautilus.desktop', 'signal-desktop.desktop', 'firefox.desktop', 'chromium_chromium.desktop', 'thunderbird.desktop', 'code.desktop', 'org.gnome.gitg.desktop', 'intellij-idea-community_intellij-idea-community.desktop', 'org.gnome.Terminal.desktop']"

echo fs.inotify.max_user_watches=524288 | sudo tee -a /etc/sysctl.conf
echo vm.swappiness = 10                 | sudo tee -a /etc/sysctl.conf
sudo sysctl -p

git config --global color.ui true
git config --global pull.rebase true
git config --global user.name "Jens Awisus"
git config --global user.email "awisus.jens@gmail.com"

exec $SOURCE

# manual steps
echo "Installation abgeschlossen!"
echo "Noch zu installieren: pcloud"
