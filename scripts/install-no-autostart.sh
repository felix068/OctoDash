#!/bin/bash

release=$(curl -s "https://api.github.com/repos/UnchartedBull/OctoDash/releases/latest" | grep "browser_download_url.*armv7l.deb" | cut -d '"' -f 4)
dependencies="libgtk-3-0 libnotify4 libnss3 libxss1 libxtst6 xdg-utils libatspi2.0-0 libuuid1 libappindicator3-1 libsecret-1-0 gir1.2-gnomekeyring-1.0"

echo "Installing OctoPrint Plugins"
~/OctoPrint/venv/bin/pip install -q "https://github.com/OllisGit/OctoPrint-DisplayLayerProgress/releases/latest/download/master.zip"
if [[ $* == *--ptg* ]]
then
    ~/OctoPrint/venv/bin/pip install -q "https://github.com/eyal0/OctoPrint-PrintTimeGenius/archive/master.zip"
fi

echo "Installing Dependencies"
sudo apt -qq update
sudo apt -qq install $dependencies -y

echo "Installing OctoDash"
cd ~
wget -O octodash.deb $release -q --show-progress

sudo dpkg -i octodash.deb

rm octodash.deb