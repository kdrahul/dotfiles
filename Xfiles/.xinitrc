#######################################
# DWM 
#######################################
# xset r rate 225 100
# xrandr --output eDP-1 --brightness 0.5
# xrandr --output HDMI-1 --right-of eDP-1 --auto
# setxkbmap -option ctrl:nocaps
# /usr/lib/x86_64-linux-gnu/libexec/kdeconnectd &
# 
# # feh --bg-scale $HOME/Pictures/Wallpapers/grey_mountain.jpg
# 
# /usr/bin/picom -b
# pulseaudio --start
# slstatus &
# exec dwm

#######################################
# BSPWM 
#######################################
xrandr --setprovideroutputsource modesetting NVIDIA-0
xrandr --auto
exec bspwm
