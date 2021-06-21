#!/bin/bash

sudo apt-get install -y \
	libssl-dev \
	libreadline-dev \
	zlib1g-dev

rm -rf $HOME/.rbenv
git clone https://github.com/rbenv/rbenv.git      $HOME/.rbenv
git clone https://github.com/rbenv/ruby-build.git $HOME/.rbenv/plugins/ruby-build
