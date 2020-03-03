#!/bin/bash
sudo apt-get update
echo Installing xorg...
sudo apt-get install --no-install-recommends xserver-xorg
echo Installing Chromium for the GUI...
sudo apt-get install chromium-browser
echo Enabling display...
read -n 1 -s -r -p "Press any key to continue, it will reboot when done."
cd ~
git clone https://github.com/goodtft/LCD-show
chmod -R 755 LCD-show 
cd ~/LCD-show
sudo ./LCD35-show 0
echo If your device has NOT rebooted, it will now.
sudo reboot