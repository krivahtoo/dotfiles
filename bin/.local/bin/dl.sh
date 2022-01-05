#!/usr/bin/env zsh
#
# Download 720p video
#
set -e

cd ~/Downloads

title="$(youtube-dl -e "$@")"
id="$(youtube-dl --get-id "$@")"

youtube-dl -f 251 "$@"
youtube-dl -f 399 "$@" || youtube-dl -f 137 "$@"

ffmpeg -i "$title-$id.mp4" -i "$title-$id.webm" -c copy "$title-$id.mkv" && cp "$title-$id.mkv" ~/Videos

rm -r "$title-$id.mp4" "$title-$id.webm"
