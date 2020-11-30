#!/bin/bash

PACKAGE=/tmp/tmp.deb
wget https://release.axocdn.com/linux/gitkraken-amd64.deb -O $PACKAGE

sudo dpkg -i $PACKAGE

rm $PACKAGE
