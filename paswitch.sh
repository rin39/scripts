#!/bin/sh

# Get id using the following command: pactl list short sinks
FIRST=''
SECOND=''
# Get name using the following command: pactl list short sources
FIRST_SOURCE=''
SECOND_SOURCE=''

# Set default sink
new_default_sink=$(echo "$FIRST\n$SECOND" | dmenu -i -l 20 -fn Monospace-14 -nb '#1c1c1c' -sf '#000000' -sb '#8bd6d2' -nf '#ffffff' | cut -d " " -f2)

if [ -z $new_default_sink ]; then
	exit 1
fi

pactl set-default-sink $new_default_sink

# Move current streams to the new default sink
pactl list short sink-inputs | while read stream; do
	stream_id=$(echo $stream | cut -d " " -f1)
	pactl move-sink-input "$stream_id" "$new_default_sink"
done

# Set default source
if [ "$new_default_sink" = "$(echo $FIRST | cut -d ' ' -f2)" ]; then
	pactl set-default-source $FIRST_SOURCE
else
	pactl set-default-source $SECOND_SOURCE
fi
