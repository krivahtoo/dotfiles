#!/usr/bin/env zsh
#
set -e

cd ~/Downloads

title="$(youtube-dl -e "$@")"
id="$(youtube-dl --get-id "$@")"

exec youtube-dl -f 251 "$@"
exec youtube-dl -f 399 "$@" || exec youtube-dl -f 137 "$@"

exec ffmpeg -i "$title-$id.mp4" -i "$title-$id.webm" -c copy "$title-$id.mkv" && cp "$title-$id.mkv" ~/Videos

