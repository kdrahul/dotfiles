#!/usr/bin/bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Set colors according to those defined by wal
# background=$color0
# background_alt=$color3
# foreground=$color15
# foreground_alt=$color2
# highlight=$color4

# start one on every possible active monitor
# https://github.com/polybar/polybar/issues/763#issuecomment-331604987
# if type "xrandr"; then
#   for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
#     MONITOR=$m polybar --reload top_external  --config=/home/rdk/.config/polybar/config.ini & 
#   done
# else
#   polybar --reload main --config=/home/rdk/.config/polybar/config.ini &
# fi
# if [[ $(xrandr --query | grep 'HDMI-1') = *connected* ]]; then
#     polybar --reload top_external --config=/home/rdk/.config/polybar/config.ini &
# fi

# Launch bar
polybar --config=~/.config/polybar/config.ini --reload main & 

# external_monitor=$(xrandr --query | grep 'HDMI-1')
# if [[ $external_monitor = *connected* ]] ; then
#     polybar --config=/home/rdk/.config/polybar/config.ini --reload top_external &
# fi

# polybar --config=/home/rdk/.config/polybar/config.ini main &
# polybar --config=/home/rdk/.config/polybar/config.ini top_external &
