#!/bin/bash

set -e

file="$HOME/Videos/Captures/$(date "+%Y-%m-%d_%H%M%S")_capture.mkv"

slop=$(slop --nokeyboard -f "%x %y %w %h %g %i") || exit 1
read -r X Y W H G ID < <(echo $slop)
echo "Dimensions: $W x $H"
ffmpeg -f x11grab -s "$W"x"$H" -i :0.0+$X,$Y -f pulse -ac 2 -i default $file

echo "File saved to $file"
