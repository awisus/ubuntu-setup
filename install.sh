#!/bin/bash

SYSTEM=$1

case $SYSTEM in

  mac)
    # add keyboard support for mac
    mkdir -p $HOME/.config/autostart
    cp mac/xmodmap.desktop $HOME/.config/autostart
    cp mac/Xmodmap         $HOME/.Xmodmap
    xmodmap                $HOME/.Xmodmap
    ;;

  *)
    ;;
esac

# apps
sudo apt update
sudo apt dist-upgrade -y

sudo apt install -y \
     build-essential \
     curl \
     deja-dup \
     dconf-editor \
     default-jdk \
     exfat-fuse \
     exfat-utils \
     gimp \
     git \
     gnome-tweak-tool \
     seahorse \
     seahorse-nautilus \
     thunderbird \
     ttf-mscorefonts-installer \
     snapd

sudo snap set system refresh.retain=2
sudo snap install --classic bitwarden
sudo snap install --classic intellij-idea-ultimate
sudo snap install --classic heroku

bash apps/code.sh
bash apps/gitkraken.sh
bash apps/insomnia.sh
bash apps/signal.sh

bash tools/docker.sh
bash tools/flutter.sh
bash tools/node.sh
bash tools/ruby.sh
bash tools/zsh.sh

# config
bash fonts/fonts.sh
bash config/gedit.sh

cp config/hidden $HOME/.hidden
cp config/zshrc  $HOME/.zshrc

gsettings set org.gnome.shell.app-switcher current-workspace-only              true

gsettings set org.gnome.shell.extensions.desktop-icons show-home               false
gsettings set org.gnome.shell.extensions.desktop-icons show-trash              true
gsettings set org.gnome.shell.extensions.ding show-trash                       true

gsettings set org.gnome.shell.extensions.dash-to-dock dock-fixed               false
gsettings set org.gnome.shell.extensions.dash-to-dock extend-height            false
gsettings set org.gnome.shell.extensions.dash-to-dock click-action             'minimize'
gsettings set org.gnome.shell.extensions.dash-to-dock show-trash               false
gsettings set org.gnome.shell.extensions.dash-to-dock intellihide              false
gsettings set org.gnome.shell.extensions.dash-to-dock require-pressure-to-show false
gsettings set org.gnome.shell.extensions.dash-to-dock scroll-action            'cycle-windows'

gsettings set org.gnome.shell favorite-apps "['org.gnome.Nautilus.desktop', 'org.gnome.Terminal.desktop', 'signal-desktop.desktop', 'thunderbird.desktop', 'firefox.desktop', 'intellij-idea-ultimate_intellij-idea-ultimate.desktop', 'gitkraken.desktop']"

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
