#!/bin/bash

curl -fsSL https://updates.signal.org/desktop/apt/keys.asc | sudo gpg --dearmor --yes -o /usr/share/keyrings/signal-desktop-keyring.gpg
sudo curl -fsSLo /etc/apt/sources.list.d/signal-desktop.sources https://updates.signal.org/static/desktop/apt/signal-desktop.sources

sudo apt update
sudo apt install -y signal-desktop
