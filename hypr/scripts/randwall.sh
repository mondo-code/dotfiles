#!/bin/bash

WALLPAPER_DIRECTORY=~/Pictures/Wallpapers

WALLPAPER=$(find "$WALLPAPER_DIRECTORY" -type f | shuf -n 1)

wallust run $WALLPAPER
if pgrep wbg; then
	killall wbg;
fi
wbg -s $WALLPAPER &

sleep 1
