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
     libfuse2t64 \
     mangohud \
     openjdk-21-jdk \
     openssh-server \
     ripgrep \
     snapd \
     software-properties-gtk \
     thunderbird \
     tmux \
     totem \
     ttf-mscorefonts-installer \
     v4l2loopback-dkms \
     vim \
     wine winetricks \
     xsel
sudo ufw allow 22
sudo systemctl enable ssh                                                                         
sudo systemctl start ssh
sudo snap install --classic intellij-idea

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
brew install git-delta
brew install fzf
brew install lazydocker
brew install lazygit
brew install neovim

bash apps/signal.sh
bash apps/steam.sh
bash apps/obs.sh

bash tools/docker.sh
bash tools/flutter.sh
bash tools/jenv.sh
bash tools/node.sh
bash tools/protonup.sh
bash tools/zsh.sh

cp config/hidden                                    $HOME/.hidden
cp bin/*                                            $HOME/.local/bin/
chmod +x                                            $HOME/.local/bin/*
mkdir -p                                            $HOME/.local/share/icons/
cp icons/*                                          $HOME/.local/share/icons/
mkdir -p                                            $HOME/.local/share/nautilus/scripts
cp scripts/*                                        $HOME/.local/share/nautilus/scripts/
chmod +x                                            $HOME/.local/share/nautilus/scripts/*
cp applications/*.desktop                           $HOME/.local/share/applications/
chmod +x                                            $HOME/.local/share/applications/*
mkdir -p                                            $HOME/.config/autostart 
cp autostart/*.desktop                              $HOME/.config/autostart/
ln -s $HOME/.local/share/applications/steam.desktop $HOME/.config/autostart/steam.desktop

# services
sudo cp service/wol.service /etc/systemd/system/wol.service
sudo systemctl enable wol.service

# config
bash fonts/install.sh

gsettings set org.gnome.desktop.wm.preferences button-layout                   'close:'

gsettings set org.gnome.shell.app-switcher current-workspace-only              true

gsettings set org.gnome.shell.extensions.ding show-home                        false
gsettings set org.gnome.shell.extensions.ding show-trash                       false

gsettings set org.gnome.shell.extensions.dash-to-dock dock-fixed               false
gsettings set org.gnome.shell.extensions.dash-to-dock dock-position            'BOTTOM'
gsettings set org.gnome.shell.extensions.dash-to-dock extend-height            false
gsettings set org.gnome.shell.extensions.dash-to-dock click-action             'minimize'
gsettings set org.gnome.shell.extensions.dash-to-dock show-trash               false
gsettings set org.gnome.shell.extensions.dash-to-dock intellihide              true
gsettings set org.gnome.shell.extensions.dash-to-dock require-pressure-to-show false
gsettings set org.gnome.shell.extensions.dash-to-dock scroll-action            'cycle-windows'

gsettings set org.gnome.mutter center-new-windows                              true

gsettings set org.gnome.Ptyxis default-columns                                 120
gsettings set org.gnome.Ptyxis default-rows                                    40
gsettings set org.gnome.Ptyxis restore-session                                 false    
gsettings set org.gnome.Ptyxis restore-window-size                             false
gsettings set org.gnome.Ptyxis window-size                                     "(120, 40)"

gsettings set org.gnome.shell favorite-apps "['org.gnome.Nautilus.desktop', 'org.gnome.Ptyxis.desktop', 'firefox_firefox.desktop', 'thunderbird_thunderbird.desktop', 'signal-desktop.desktop', 'steam.desktop', 'intellij-idea_intellij-idea.desktop', 'com.blackmagicdesign.resolve.desktop', 'com.obsproject.Studio.desktop']"

echo fs.inotify.max_user_watches=524288 | sudo tee -a /etc/sysctl.conf
echo vm.swappiness=10                   | sudo tee -a /etc/sysctl.conf
echo vm.max_map_count=10485776          | sudo tee -a /etc/sysctl.conf
sudo sysctl -p

exec $SOURCE

# manual steps
echo "Installation abgeschlossen!"
echo "Noch zu installieren: pcloud, Davinvi Resolve"
