#!/usr/bin/env sh

set -e

query="$(echo $1 | sed 's/ /+/g')"

file=$(mktemp /tmp/tts.XXXXXXX.mp3 | tr -d '\n')

wget -q -U Mozilla -O $file "http://translate.google.com/translate_tts?ie=UTF-8&total=1&idx=0&textlen=32&client=tw-ob&q=$query&tl=En-gb"

mpv --really-quiet $file
