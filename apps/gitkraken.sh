#!/bin/bash

PACKAGE=/tmp/gitkraken.deb
wget https://release.axocdn.com/linux/gitkraken-amd64.deb -O $PACKAGE

sudo dpkg -i $PACKAGE

rm $PACKAGE
