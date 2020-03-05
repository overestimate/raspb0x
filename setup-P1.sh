#!/bin/bash
sudo apt-get update
echo Installing xorg...
sudo apt-get -y install --no-install-recommends xserver-xorg xinit
echo Installing Chromium for the GUI...
sudo apt-get -y install chromium-browser
echo Enabling display...
read -n 1 -s -r -p "Press any key to continue, it will reboot when done."
cd ~
git clone https://github.com/goodtft/LCD-show
chmod -R 755 LCD-show 
cd ~/LCD-show
sudo ./LCD35-show
echo If your device has NOT rebooted, it will now.
sudo reboot
