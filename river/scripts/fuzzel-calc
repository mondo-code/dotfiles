#!/usr/bin/env sh

# holds last result
LAST=""

while true; do
	[ -z "$LAST" ] && SPACE=" "
	NEXT="$(fuzzel -l 0 --dmenu -p "${LAST}${SPACE}")"
	# Quit if empty
	[ -z "$NEXT" ] && exit 1
	# Copy and exit if y is entered
	[ "$NEXT" = "y" ] && wl-copy "$LAST" && exit 0
	# Pipe the expression into bc and strip off trailing zeroes
	LAST="$(echo "$LAST$NEXT" | bc -l | sed '/\./ s/\.\{0,1\}0\{1,\}$//')"
done
