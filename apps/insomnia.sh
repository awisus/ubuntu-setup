#!/bin/bash

PACKAGE=/tmp/insomnia.deb
wget "https://updates.insomnia.rest/downloads/ubuntu/latest?=&app=com.insomnia.app" -O $PACKAGE

sudo dpkg -i $PACKAGE

rm $PACKAGE
