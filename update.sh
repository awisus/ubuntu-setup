#!/bin/bash

function print_status() {
    echo "$(tput setaf 2)==>$(tput bold) $1$(tput sgr0)"
}

function update_chromedriver() {
    version=$(curl -s "https://googlechromelabs.github.io/chrome-for-testing/LATEST_RELEASE_STABLE")
    wget -qP /tmp/ "https://storage.googleapis.com/chrome-for-testing-public/$version/linux64/chromedriver-linux64.zip"
    unzip -o /tmp/chromedriver-linux64.zip -d /tmp
    sudo cp /tmp/chromedriver-linux64/chromedriver /usr/bin/chromedriver
}

if [ -f "/usr/bin/chromedriver" ] ; then
    print_status "UPDATING CHROMEDRIVER"
    update_chromedriver
    echo "done."
    echo ""
fi

if which flutter >/dev/null ; then
    print_status "UPDATING FLUTTER"
    flutter upgrade
    echo "done."
    echo ""
fi

if which rustup >/dev/null ; then
    print_status "UPDATING RUST"
    rustup update
    echo "done."
    echo ""
fi

print_status "UPDATING SYSTEM"
sudo apt update && sudo apt upgrade -y && sudo apt dist-upgrade -y && sudo apt autoremove
echo "done."
echo ""

print_status "BREW UPGRADE"
brew upgrade --force
brew cleanup
echo "done."
echo ""

print_status "SUCCESS"
