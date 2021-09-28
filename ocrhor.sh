#!/bin/sh

# OCR script for horizontal Japanese text

maim -su |
tesseract stdin stdout \
	-l jpn \
	-c preserve_interword_spaces=1 \
	--psm 6 |
tr -d ' ' |
xclip -selection clipboard
