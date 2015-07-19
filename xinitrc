#!/bin/bash
#export BROWSER=firefox
#export DE=openbox
#exec dbus-launch openbox-session
setxkbmap is

eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK

nitrogen --restore & #wallpaper
xfce4-power-manager & 
trayer --edge top --align right --SetDockType true --SetPartialStrut true --expand true --width 6 --transparent true --alpha 0 --tint 0x000000 --height 16 &  
#~/.screenlayout/archRight.sh
nm-applet & 
=======
#dropboxd &
volumeicon &
mpd &
#systemctl start cups.service &
xsetroot -cursor_name left_ptr
sleep 15 && dropboxd &
exec dbus-launch xmonad

