#!/bin/sh

# Clipboard support for Anki

# Define path to the screenshot directory:
DIRECTORY="$HOME/example_directory"

maim -su "$DIRECTORY/$(date +%y-%m-%d_%H-%M-%S).png" | echo "file://$DIRECTORY/$(date +%y-%m-%d_%H-%M-%S).png" | xclip -sel c
