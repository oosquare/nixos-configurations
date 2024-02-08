#! /usr/bin/env -S zsh --no-rcs

LOCK_COMMAND='~/.scripts/executables/lock.sh'

swayidle -w \
    timeout 300 "$LOCK_COMMAND" \
    timeout 600 "systemctl suspend" \
    before-sleep "$LOCK_COMMAND" &

sway-audio-idle-inhibit
