#!/usr/bin/env bash

# read URL from easily accessible location
URL=$(head -n 1 /boot/kiosk.url)

# never blank the screen
xset s off -dpms

# rotate to portrait mounted TV
xrandr --output HDMI-1 --rotate left

# show a splash before browser kicks in
feh --bg-scale splash.png

# start the cec-client & browser
(cec-client | cec2keyboard) & browser --fullscreen "${URL:='https://deltazero.cz'}"
