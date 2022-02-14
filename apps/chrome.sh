#!/bin/bash

PACKAGE=/tmp/chrome.deb
wget "https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb" -O $PACKAGE

sudo dpkg -i $PACKAGE

rm $PACKAGE
