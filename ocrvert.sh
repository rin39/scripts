#!/bin/sh

# OCR script for vertical Japanese text.

maim -s |
tesseract stdin stdout \
	-l jpn_vert \
	-c preserve_interword_spaces=1 \
	--psm 5 |
tr -d ' ' |
xclip -selection clipboard
