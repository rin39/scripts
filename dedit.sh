#!/bin/sh

# Define editor and terminal emulator:
EDITOR="vim"
TERMINAL="alacritty"

# Define dmenu prompt appearance:
DMENU="dmenu -i -l 20 -fn Monospace-14 -nb #1c1c1c -sf #000000 -sb #8bd6d2 -nf #ffffff"

# Define directory with text files:
DIRECTORY=~/example_directory

file=$(ls -p $DIRECTORY | grep -v / | $DMENU)
if [ -z "$file" ]; then
  exit 1
else
  $TERMINAL -e $EDITOR "$DIRECTORY/$file"
fi
