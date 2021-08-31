#!/bin/sh

# Clipboard support for Anki
# Any other ffmpeg process should not be running.

# Define path to the directory where recorded audio will be stored:
DIRECTORY="$HOME/example_directory"
# Define name for the temp file:
TEMPFILE="$DIRECTORY/rec.ogg"

# Can also be done with:
# if test -f "$TEMPFILE"
# but feels slower than pgrep.

if pgrep -x "ffmpeg" > /dev/null
then
	killall ffmpeg
	filename="$DIRECTORY/$(date +%d-%m_%H-%M-%S).ogg"
	mv $TEMPFILE $filename
	echo "file://${filename}" | xclip -sel c
	notify-send "Done! $filename recorded!"
else
	notify-send "Recording audio..."
	ffmpeg -f pulse -i default -ac 2 -c:a libopus -b:a 96K -y "$TEMPFILE"
fi
