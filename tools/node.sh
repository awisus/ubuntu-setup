#!/bin/bash

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

rm -rf ~/.nvm

curl https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash

nvm install --lts
npm install -g yarn
