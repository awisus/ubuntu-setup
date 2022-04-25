#!/bin/bash

# apps
sudo apt update
sudo apt dist-upgrade -y
sudo add-apt-repository ppa:mozillateam/ppa -y

echo '
Package: *
Pin: release o=LP-PPA-mozillateam
Pin-Priority: 1001
' | sudo tee /etc/apt/preferences.d/mozilla-firefox
echo 'Unattended-Upgrade::Allowed-Origins:: "LP-PPA-mozillateam:${distro_codename}";' | sudo tee /etc/apt/apt.conf.d/51unattended-upgrades-firefox

sudo apt install -y \
     build-essential \
     curl \
     deja-dup \
     dconf-editor \
     default-jdk \
     exfat-fuse \
     exfat-utils \
     firefox \
     gimp \
     git \
     gitg \
     gnome-tweaks \
     seahorse \
     seahorse-nautilus \
     thunderbird \
     ttf-mscorefonts-installer \
     snapd

sudo snap set system refresh.retain=2
sudo snap remove firefox
sudo snap install --classic bitwarden
sudo snap install --classic intellij-idea-ultimate
sudo snap install --classic heroku

bash apps/chrome.sh
bash apps/code.sh
bash apps/insomnia.sh
bash apps/signal.sh

bash tools/docker.sh
bash tools/flutter.sh
bash tools/node.sh
bash tools/ruby.sh
bash tools/zsh.sh

# config
bash fonts/fonts.sh

cp config/hidden $HOME/.hidden
cp config/zshrc  $HOME/.zshrc

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

gsettings set org.gnome.shell favorite-apps "['org.gnome.Nautilus.desktop', 'signal-desktop.desktop', 'thunderbird.desktop', 'firefox.desktop', 'intellij-idea-ultimate_intellij-idea-ultimate.desktop', 'org.gnome.gitg.desktop', 'org.gnome.Terminal.desktop']"

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
