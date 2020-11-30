#!/bin/bash

# directories
mkdir -p $HOME/android
mkdir -p $HOME/flutter
mkdir -p $HOME/.local/bin 

# apps
sudo apt update
sudo apt dist-upgrade -y
sudo apt install -y \
     bluez-tools \
     build-essential \
     curl \
     deja-dup \
     dconf-editor \
     exfat-fuse \
     gimp \
     git \
     gnome-browser-connector \
     gnome-tweaks \
     gnome-shell-extensions \
     libreoffice \
     lutris \
     openjdk-21-jdk \
     ripgrep \
     ssh \
     thunderbird \
     tmux \
     totem \
     ttf-mscorefonts-installer \
     vim \
     wine winetricks wine32:i386 \
     xsel
sudo ufw allow 22

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
brew install git-delta
brew install fzf
brew install lazydocker
brew install lazygit
brew install neovim

bash apps/firefox.sh
bash apps/signal.sh
bash apps/steam.sh

bash tools/docker.sh
bash tools/flutter.sh
bash tools/jenv.sh
bash tools/node.sh
bash tools/protonup.sh
bash tools/zsh.sh

cp bin/*                                            $HOME/.local/bin
chmod +x                                            $HOME/.local/bin/*
cp applications/*.desktop                           $HOME/.local/share/applications
chmod +x                                            $HOME/.local/share/applications/*
cp autostart/*.desktop                              $HOME/.config/autostart
ln -s $HOME/.local/share/applications/steam.desktop $HOME/.config/autostart/steam.desktop

# services
sudo cp service/wol.service /etc/systemd/system/wol.service
sudo systemctl enable wol.service

# config
bash fonts/install.sh

cp config/hidden $HOME/.hidden
cp bin/update.sh $HOME/.local/bin/update
chmod +x         $HOME/.local/bin/update
cp bin/tms.sh    $HOME/.local/bin/tms
chmod +x         $HOME/.local/bin/tms

gsettings set org.gnome.shell.app-switcher current-workspace-only              true

gsettings set org.gnome.shell.extensions.ding show-home                        false
gsettings set org.gnome.shell.extensions.ding show-trash                       false

gsettings set org.gnome.shell.extensions.dash-to-dock dock-fixed               false
gsettings set org.gnome.shell.extensions.dash-to-dock extend-height            false
gsettings set org.gnome.shell.extensions.dash-to-dock click-action             'minimize'
gsettings set org.gnome.shell.extensions.dash-to-dock show-trash               true
gsettings set org.gnome.shell.extensions.dash-to-dock intellihide              true
gsettings set org.gnome.shell.extensions.dash-to-dock require-pressure-to-show false
gsettings set org.gnome.shell.extensions.dash-to-dock scroll-action            'cycle-windows'

gsettings set org.gnome.mutter center-new-windows                              true

gsettings set org.gnome.shell favorite-apps "['org.gnome.Terminal.desktop', 'org.gnome.Nautilus.desktop', 'signal-desktop.desktop', 'thunderbird_thunderbird.desktop', 'firefox.desktop', 'net.lutris.Lutris.desktop']"

echo fs.inotify.max_user_watches=524288 | sudo tee -a /etc/sysctl.conf
echo vm.swappiness=10                   | sudo tee -a /etc/sysctl.conf
echo vm.max_map_count=10485776          | sudo tee -a /etc/sysctl.conf
sudo sysctl -p

exec $SOURCE

# manual steps
echo "Installation abgeschlossen!"
echo "Noch zu installieren: pcloud"
