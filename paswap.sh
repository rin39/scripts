#!/bin/sh

new_default_sink=$(pactl list sinks short | grep SUSPENDED | cut -f1)
new_default_source=$(pactl list sources short | grep SUSPENDED | cut -f2)

# Set default sink
pactl set-default-sink "$new_default_sink"

# Move current streams to the new default sink
pactl list short sink-inputs | while read -r stream; do
	stream_id=$(echo "$stream" | cut -d " " -f1)
	pactl move-sink-input "$stream_id" "$new_default_sink"
done

# Set default source
pactl set-default-source "$new_default_source"

# Send notification
notify-send "Default source and sink has been changed."
