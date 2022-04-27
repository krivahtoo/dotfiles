#!/usr/bin/env sh

set -e

case "$1" in
  select)
    slop=$(slop --nokeyboard -f "%x %y %w %h %g %i") || exit 1
    read -r X Y W H G ID < <(echo $slop)
    cd /tmp && scrot -t 100x100 -a $X,$Y,$W,$H \
      -e 'mv $f ~/Pictures/Screenshots/ 2>/dev/null && notify-send "screenshot taken" -t 2000 -a "Scrot" --icon=/tmp/$m && echo "~/Pictures/Screenshots/$f" | xsel -i' \
      && paplay /usr/share/sounds/freedesktop/stereo/screen-capture.oga
    ;;
  screen)
    cd /tmp && scrot -t 100x100 \
      -e 'mv $f ~/Pictures/Screenshots/ 2>/dev/null && notify-send "screenshot taken" -t 2000 -a "Scrot" --icon=/tmp/$m && echo "~/Pictures/Screenshots/$f" | xsel -i' \
      && paplay /usr/share/sounds/freedesktop/stereo/screen-capture.oga
    ;;
  window)
    cd /tmp && scrot -t 100x100 -u \
      -e 'mv $f ~/Pictures/Screenshots/ 2>/dev/null && notify-send "screenshot taken" -t 2000 -a "Scrot" --icon=/tmp/$m && echo "~/Pictures/Screenshots/$f" | xsel -i' \
      && paplay /usr/share/sounds/freedesktop/stereo/screen-capture.oga
    ;;
  text)
    imagefile="/tmp/sloppy.$RANDOM.png"
    text="/tmp/ocr"
    slop=$(slop --nokeyboard -f "%g") || exit 1
    read -r G < <(echo $slop)
    import -window root -crop $G $imagefile
    tesseract $imagefile $text 2>/dev/null 
    cat $text".txt" | xclip -selection c
    notify-send "text copied to clipboard" -t 2000 -a "Slop" --icon=$imagefile
    ;;
  *)
    exit 1
    ;;
esac

