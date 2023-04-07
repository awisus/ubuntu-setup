#!/bin/bash

function print_status() {
    echo "$(tput setaf 2)==>$(tput bold) $1$(tput sgr0)"
}

function update_system() {
    sudo apt update && sudo apt upgrade -y && sudo apt dist-upgrade -y && sudo apt autoremove
}

function update_chromedriver() {
    version=$(curl -s "https://chromedriver.storage.googleapis.com/LATEST_RELEASE")
    wget -qP /tmp/ "https://chromedriver.storage.googleapis.com/${version}/chromedriver_linux64.zip"
    sudo unzip -o /tmp/chromedriver_linux64.zip -d /usr/bin
}

if [ -f "/usr/bin/chromedriver" ] ; then
    print_status "UPDATING CHROMEDRIVER"
    update_chromedriver
    echo "done."
    echo ""
fi

print_status "UPDATING SYSTEM"
update_system
echo "done."
echo ""

print_status "SUCCESS"
