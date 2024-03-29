#! /usr/bin/env -S zsh --no-rcs

alacritty msg create-window "$@" || alacritty "$@"
