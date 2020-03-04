#!/bin/bash
cd ~
echo Grabbing latest release...
rm release-*.zip
curl -s https://api.github.com/repos/tyTheDebugger/raspb0x/releases/latest \
| grep "release-*.zip" \
| cut -d : -f 2,3 \
| tr -d \" \
| wget -qi -
echo Extracting...
rm -r raspb0x
mkdir raspb0x
unzip release-*.zip -d ./raspb0x
rm release-*.zip
echo Setting up autostart...
cd ~
echo cd /home/pi/raspb0x >> .bashrc
echo bash -c './start.sh' >> .bashrc
echo Installing checkra1n dependencies and latest version ATM... deps are the only needed thing.
echo "deb https://assets.checkra.in/debian /" | sudo tee -a /etc/apt/sources.list
sudo apt-key adv --fetch-keys https://assets.checkra.in/debian/archive.key
sudo apt update
sudo apt-get install checkra1n
echo Please navigate to Boot Options and next to Console Auto-Login and enable it.
read -n 1 -s -r -p "Press any key to continue, it will reboot when done."
sudo raspi-config
echo Reboot needed to complete setup.
sudo reboot
