#!/bin/bash
cd ~
echo Grabbing latest release...
rm release-*.zip
curl -s https://api.github.com/repos/tyTheDebugger/raspb0x/releases/latest \
| grep \"browser_download_url\" \
| cut -d : -f 2,3 \
| tr -d \" \
| wget -qi -
echo Extracting...
unzip -o release-*.zip -d ./raspb0x
rm release-*.zip
echo 'Setting up autostart...'
cd ~
echo 'cd /home/pi/raspb0x/web' >> .bashrc
echo 'bash -c \'sudo startx ./start.sh\'' >> .bashrc
echo 'Installing checkra1n dependencies...'
sudo apt-get install -y usbmuxd
echo 'Please navigate to Boot Options and next to Console Auto-Login and enable it.'
read -n 1 -s -r -p "Press any key to continue, it will reboot when done."
sudo raspi-config
echo Reboot needed to complete setup.
sudo reboot
