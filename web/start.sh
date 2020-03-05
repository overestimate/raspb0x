#!/bin/sh
xset -dpms
xset s off
xset s noblank

unclutter &
python3 -m http.server 8080 --bind 127.0.0.1 --cgi &
chromium-browser localhost:8080 --window-size=320,480 --start-fullscreen --kiosk --incognito --noerrdialogs --disable-translate --no-first-run --fast --fast-start --disable-infobars --disable-features=TranslateUI --disk-cache-dir=/dev/null  --password-store=basic
