#!/bin/sh

# Create clip from Youtube video.

DIRECTORY="$HOME/example_directory"

url=$(xclip -o -selection clipboard)
echo "$url"

echo "Enter start time (00:01:00)"
read -r start_time
echo "Enter end time (00:02:00)"
read -r end_time

duration="$(($(date -d "$start_time" '+%s') - $(date -d "$end_time" '+%s')))"
duration=$( echo $duration | cut -c 2- )

ffmpeg -ss "$start_time" -i "$(youtube-dl -f best --get-url "$url")" \
-t "$duration" -c:v copy -c:a copy "$DIRECTORY/$(date +%s).mkv"
