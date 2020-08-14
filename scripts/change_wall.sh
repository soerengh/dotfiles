#!/bin/bash
FILE="$(find /home/$USER/wallpapers/ -printf "%f\n" | tail -n +2 | shuf | tail -n 1)"
feh --bg-tile /home/$USER/wallpapers/"$FILE" 2>error.log
