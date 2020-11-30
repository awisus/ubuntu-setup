#!/bin/bash

git clone https://github.com/AUNaseef/protonup
cd protonup
python3 setup.py install --user
cd ..
rm -rf protonup

export PATH="$HOME/.local/bin:$PATH"
protonup -d "~/.steam/root/compatibilitytools.d/"
protonup
