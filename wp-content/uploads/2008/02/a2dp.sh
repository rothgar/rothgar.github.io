#!/bin/bash

echo "FOSSwire A2DP Connection Script"
echo "Copyright 2008 FOSSwire.com. Released under the GPL3."
echo "GStreamer toggle script from http://wiki.debian.org/BluetoothAlsa\n"

echo "Making .a2dp in ~"
cd
mkdir -p .a2dp

echo -n "Getting a2dp.py connection script..."
cd .a2dp
wget -qr -O a2dppy http://files.fosswire.com/scripts/a2dp/a2dp
echo "  done.\n"

echo "\nWe're now going to scan for a bluetooth device. Please put your headset in pairing mode and press Enter."
read nil
hcitool scan
echo "See the numbers starting with 00? That's your MAC address.\nCopy that and paste it below:"
read macaddr
sed s/sedmac/$macaddr/ a2dppy > a2dp.py

echo -n "Installing .asoundrc Bluetooth device..."
cd
wget -qr -O .asoundrc http://files.fosswire.com/scripts/a2dp/asoundrc
echo " done."

echo -n "Installing autostart script in ~/.config/autostart..."
mkdir -p .config/autostart
cd .config/autostart
wget -qr -O a2dp-connect.desktop http://files.fosswire.com/scripts/a2dp/a2dp.desktop
echo " done."

echo -n "Setting up GStreamer support..."
cd ~/.a2dp
wget -q -O toggle.sh http://files.fosswire.com/scripts/a2dp/togglesh
chmod +x toggle.sh
echo " done.\n"

echo "Starting up..."
python a2dp.py

echo "All set up! Please read the rest of the tutorial online at FOSSwire.com to learn how to toggle the headphones on and off."
