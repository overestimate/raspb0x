# raspb0x (WIP)
Raspberry Pi 3B based checkra1n dongle.
## Supply List:
 * [This screen. It ships fast and is cheap. Not the best, but who cares?](https://www.amazon.com/kuman-Touch-Screen-Display-Raspberry/dp/B07KLDKM5D)
 * [Rapsberry Pi 3B](https://www.amazon.com/Raspberry-Pi-MS-004-00000024-Model-Board/dp/B01LPLPBS8)
 * power adapter/portable charger with 2.1A output minimum
 * microUSB cable
 * this software
 
 ## Setup
  1. Download Raspbian Lite (no NOOBS) from [this official torrent](http://downloads.raspberrypi.org/raspbian_lite/images/raspbian_lite-2019-04-09/2019-04-08-raspbian-stretch-lite.zip.torrent).
  2. Burn to 8GB+ microSD with software of your choosing. Etcher recommended.
  3. Drag and drop [wpa_supplicant.conf (tutorial linked)](https://www.raspberrypi-spy.co.uk/2017/04/manually-setting-up-pi-wifi-using-wpa_supplicant-conf/) to the FAT32 partition, along side a blank file named `ssh`.
  4. Connect power and turn on. Wait a little, and try to SSH to your pi. The IP can be found with arp, nmap, or by using MDNS (raspberrypi.local).
   4a. If this fails, hook up HDMI after waiting 5 minutes and reboot to enable HDMI. You can troubleshoot Wi-Fi
   4b. If not, continue.
  5. Once in SSH, use username `pi` and password `raspberry` to login.
  6. Execute `sudo raspi-config` and change the password to `raspb0x` using first option. Don't forget this!
  7. Run `sudo apt-get update && sudo apt-get install git` and wait for it to finish.
  8. Run `git clone https://github.com/tyTheDebugger/raspb0x.git`.
  9. Once cloned, execute `chmod -R 755 rainb0x && cd raspb0x`.
  10. Run `./setup-P1.sh` and follow instructions if needed.
  11. Once rebooted, you should see a display up and running. Use SSH to login (most likely same IP), using `pi` with password `raspb0x`
  12. Run `cd raspb0x`.
  13. Run `./setup-P2.sh`. This will finish the setup and reboot.
  14. If all is well, you will see a GUI designed for no keyboard.
  15. Done!

## What's WIP?
 * The UI, it needs CSS and functionality.
