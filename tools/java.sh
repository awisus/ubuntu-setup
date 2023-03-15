#!/bin/bash

# jdk

sudo rm -rf /etc/apt/sources.list.d/adoptium.list

wget -O - https://packages.adoptium.net/artifactory/api/gpg/key/public | sudo apt-key add -
echo "deb https://packages.adoptium.net/artifactory/deb $(awk -F= '/^VERSION_CODENAME/{print$2}' /etc/os-release) main" | sudo tee /etc/apt/sources.list.d/adoptium.list

sudo apt install -y \
     temurin-11-jdk \
     temurin-17-jdk
sudo apt update

# jenv

rm -rf $HOME/.jenv

git clone https://github.com/jenv/jenv.git ~/.jenv

export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"

jenv add /usr/lib/jvm/temurin-11-jdk-amd64/
jenv add /usr/lib/jvm/temurin-17-jdk-amd64/
jenv global 17
jenv enable-plugin gradle
jenv enable-plugin maven
jenv enable-plugin export
