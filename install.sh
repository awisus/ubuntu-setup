#!/bin/bash

# apps
sudo apt update
sudo apt dist-upgrade -y
sudo apt install -y \
     build-essential \
     curl \
     deja-dup \
     dconf-editor \
     exfat-fuse \
     gimp \
     git \
     gnome-tweaks \
     openjdk-21-jdk \
     ripgrep \
     seahorse \
     seahorse-nautilus \
     tmux \
     ttf-mscorefonts-installer \
     xsel

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
brew install git-delta
brew install fzf
brew install lazydocker
brew install lazygit
brew install neovim

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
cp tms.sh        $HOME/.local/bin/tms
chmod +x         $HOME/.local/bin/tms

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

gsettings set org.gnome.shell favorite-apps "['org.gnome.Terminal.desktop', 'org.gnome.Nautilus.desktop', 'signal-desktop.desktop', 'thunderbird.desktop', 'firefox.desktop']"

echo fs.inotify.max_user_watches=524288 | sudo tee -a /etc/sysctl.conf
echo vm.swappiness=10                   | sudo tee -a /etc/sysctl.conf
echo vm.max_map_count=10485776          | sudo tee -a /etc/sysctl.conf
sudo sysctl -p

exec $SOURCE

# manual steps
echo "Installation abgeschlossen!"
echo "Noch zu installieren: pcloud"
