#!/bin/bash

rm -rf $HOME/flutter

git clone https://github.com/flutter/flutter.git -b stable $HOME/flutter

$HOME/flutter/bin/flutter precache
$HOME/flutter/bin/flutter config --enable-linux-desktop

sudo apt install -y clang cmake ninja-build pkg-config libgtk-3-dev liblzma-dev libstdc++-12-dev
