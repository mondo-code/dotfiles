#!/bin/bash

if pgrep waybar; then
	pkill waybar && waybar &
else
	waybar &
fi
