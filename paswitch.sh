#!/bin/sh

# Get id using the following command: pactl list short sinks
# Get name using the following command: pactl list short sources
# FIRST='HDMI 0 alsa_output*'
FIRST=''
SECOND=''
DMENU='dmenu -i -l 20 -fn Monospace-14 -nb '#1c1c1c' -sf '#000000' -sb '#8bd6d2' -nf '#ffffff''

choice=$(echo "$FIRST\n$SECOND" | $DMENU)

if [ -z "$choice" ]; then
	exit 1
fi

# Set default sink
new_default_sink=$(echo "$choice" | cut -d ' ' -f2)
pactl set-default-sink $new_default_sink

# Move current streams to the new default sink
pactl list short sink-inputs | while read stream; do
	stream_id=$(echo $stream | cut -d " " -f1)
	pactl move-sink-input "$stream_id" "$new_default_sink"
done

# Set default source
new_default_source=$(echo "$choice" | cut -d ' ' -f3)
pactl set-default-source $new_default_source
