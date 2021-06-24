#######################################
# DWM 
#######################################
#xset r rate 250 100
#xrandr --output eDP-1 --brightness 0.5
#xrandr --output HDMI-1 --left-of eDP-1 --auto
#setxkbmap -option ctrl:nocaps
#/usr/lib/x86_64-linux-gnu/libexec/kdeconnectd &
#
#comptom -b
#feh --bg-scale /home/rdk/Pictures/Wallpapers/xayah_rakan.jpg
#
#slstatus &
#exec dwm

#######################################
# BSPWM 
#######################################
/usr/lib/x86_64-linux-gnu/libexec/kdeconnectd &
exec bspwm
