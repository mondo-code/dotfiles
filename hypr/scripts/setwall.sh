#!/bin/bash

WALLPAPER_DIRECTORY=~/Pictures/Wallpapers

WALLPAPER=$(find "$WALLPAPER_DIRECTORY" -type f | shuf -n 1)

hyprctl hyprpaper reload "DP-1,$WALLPAPER"
hyprctl hyprpaper reload "HDMI-A-1,$WALLPAPER"
wal -i "$WALLPAPER"

sleep 1

hyprctl hyprpaper unload unused
