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
echo Please navigate to Boot Options and then to Console Auto-Login and enable it.
read -n 1 -s -r -p "Press any key to continue, it will reboot when done."
sudo raspi-config
echo Reboot needed to complete setup.

sudo reboot