#!/bin/bash
cd ~
echo Grabbing latest release...
rm release-*.zip
rm -r raspb0x-rel
mkdir raspb0x-rel
curl -s https://api.github.com/repos/tyTheDebugger/raspb0x/releases/latest \
| grep \"browser_download_url\" \
| cut -d : -f 2,3 \
| tr -d \" \
| wget -qi -
echo Extracting...
unzip -o release-*.zip -d ./raspb0x-rel
rm release-*.zip
echo 'Setting up autostart...'
cd ~
chmod -R +x raspb0x-rel
echo 'cd /home/pi/raspb0x-rel/web' >> .bashrc
echo bash -c \'sudo startx'\' >> .bashrc
echo xset -dpms > .xinitrc
echo xset s off > .xinitrc
echo xset s noblank > .xinitrc
echo python3 -m http.server 8080 --bind 127.0.0.1 --cgi & > .xinitrc
echo sudo chown pi /dev/tty* > .xinitrc
echo cd /home/pi/raspb0x-rel/web > .xinitrc
echo unclutter > .xinitrc
echo exec chromium-browser http://localhost:8080 --window-size=1920,1080 --start-fullscreen --kiosk --incognito --noerrdialogs\\\
--disable-translate --no-first-run --fast --fast-start --disable-infobars --disable-features=TranslateUI --disk-cache-dir=/dev/null  --password-store=basic > .xinitrc
echo 'Installing checkra1n dependencies...'
sudo apt-get install -y usbmuxd
echo 'Please navigate to Boot Options and next to Console Auto-Login and enable it.'
read -n 1 -s -r -p "Press any key to continue, it will reboot when done."
sudo raspi-config
echo Reboot needed to complete setup.
sudo reboot
