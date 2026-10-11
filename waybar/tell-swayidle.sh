#!/bin/sh

pgrep -x swayidle >/dev/null && idle_enabled="on" || idle_enabled="off"
cat <<< "$idle_enabled"
