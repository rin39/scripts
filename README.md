| Script | Dependencies | Description |
| --- | --- | --- |
| `audiorec.sh` | <ul><li>ffmpeg</li><li>libnotify</li><li>xclip</li></ul> | Execute the script to start recording system audio, execute again to stop. |
| `dedit.sh` | <ul><li>dmenu</li></ul> | Dmenu prompt to edit text file from defined directory. |
| `dsymbols.sh` | <ul><li>dmenu</li><li>xclip</li></ul> | Get symbols (unicode symbols, emoji, kaomoji, etc.) from dmenu prompt. Can also be used with words. |
| `ocr*.sh` | <ul><li>maim</li><li>tesseract</li><li>xclip</li></ul> | Japanese OCR. |
| `screenshot.sh` | <ul><li>maim</li><li>xclip</li></ul> | Take screenshots. |
| `yomi.sh` | <ul><li>libnotify</li><li>xclip</li></ul> | Search downloaded Yomichan audio offline. |
| `ytclip.sh` | <ul><li>youtube-dl</li><li>xclip</li><li>ffmpeg</li></ul> | Make clips from youtube videos. |

Both `audiorec.sh` and `screenshot.sh` work with Anki. Recorded audio or
screenshot can be pasted into Anki.

## Usage

```
chmod +x script.sh
```

Install all dependencies on Arch-based distributions:

```
pacman -S ffmpeg libnotify xclip dmenu maim tesseract youtube-dl
```

1. Edit script configuration to your liking.
2. Bind to the desired key in your WM or DE.

[tessdata_best](https://github.com/tesseract-ocr/tessdata_best) is recommended
to be used with the OCR scripts.
