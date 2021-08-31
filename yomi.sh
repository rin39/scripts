#!/bin/sh

# Search yomichan audio offline.

DIRECTORY="$HOME/example_directory"

word=$(xclip -o sel)

found=$( ls $DIRECTORY | grep ^$word\.yomi | head -n 1 )
if [ -z "$found" ]; then
	notify-send "Nothing found"
	exit 1
else
	notify-send "Found: $found"
	echo "file://$DIRECTORY/$found" | xclip -sel c
fi
