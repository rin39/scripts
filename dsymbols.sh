#!/bin/sh

# Define path to the file containing symbols:
FILE="$HOME/example_directory/symbols_file"

# Define dmenu prompt appearance:
DMENU="dmenu -i -l 40 -fn Monospace-14 -nb #1c1c1c -sf #000000 -sb #8bd6d2 -nf #ffffff"

# symbols_file should contain symbols and their short description separated with whitespace
# Example symbols_file:
# ∞ infinity
# Ω omega
# ¥ yen

cat $FILE | $DMENU | awk '{print $1}' | tr -d '\n' | xclip -selection clipboard
