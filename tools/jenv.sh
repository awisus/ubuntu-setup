#!/bin/bash

rm -rf $HOME/.jenv

git clone https://github.com/jenv/jenv.git ~/.jenv

export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"

jenv add /usr/lib/jvm/java-17-openjdk-amd64/
jenv global 17
jenv enable-plugin gradle
jenv enable-plugin maven
jenv enable-plugin export
