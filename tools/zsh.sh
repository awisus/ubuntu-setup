#!/bin/bash

rm -rf $HOME/.oh-my-zsh

sudo apt -y install powerline fonts-powerline zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

chsh -s /bin/zsh
