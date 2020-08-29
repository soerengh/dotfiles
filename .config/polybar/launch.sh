#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

## Wait until the processes have been shut down
while pgrep -u $USER -x polybar >/dev/null; do sleep 1; done

## Launch
# polybar system -c ~/.config/polybar/config.ini &
# polybar apps -c ~/.config/polybar/config.ini &
# polybar workspace -c ~/.config/polybar/config.ini &
# polybar wallpaper -c ~/.config/polybar/config.ini &
# polybar light -c ~/.config/polybar/config.ini &
# polybar network -c ~/.config/polybar/config.ini &
# polybar info -c ~/.config/polybar/config.ini &
if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar static-left -c ~/.config/polybar/config.ini &
    MONITOR=$m polybar static-right -c ~/.config/polybar/config.ini &
  done
else
  polybar --reload example &
fi
