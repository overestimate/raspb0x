#!/bin/sh
FRAMEBUFFER=/dev/fb1 xinit /etc/X11/Xsession -- /usr/bin/Xorg :1 -br -pn -nolisten tcp -dpi 120
xset -dpms
xset s off
xset s noblank

unclutter &
cd ~/raspb0x/web &
python3 -m http.server 8080 --bind 127.0.0.1 --cgi &
chromium-browser localhost:8080 --window-size=320,480 --start-fullscreen --kiosk --incognito --noerrdialogs --disable-translate --no-first-run --fast --fast-start --disable-infobars --disable-features=TranslateUI --disk-cache-dir=/dev/null  --password-store=basic