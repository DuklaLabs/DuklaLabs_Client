#!/bin/bash

# Disable all touchscreen input devices
for dev in $(xinput --list | grep -i 'touch' | grep -o 'id=[0-9]*' | cut -d= -f2); do
    xinput disable "$dev"
done

sleep 60

# Start Chromium in kiosk mode (fullscreen, locked)
chromium --user-data-dir=/tmp/chromium-profile --kiosk --no-first-run --disable-infobars --disable-session-crashed-bubble "https://192.168.199.8:5000"

# Note: Kiosk mode locks Chromium to fullscreen and disables most exit methods.