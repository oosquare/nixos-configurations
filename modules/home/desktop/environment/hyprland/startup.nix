{ config, lib, pkgs, ... }:

{
  exec-once = [
    "fcitx5"
    "waybar"
    "mako"
    "wl-paste --type text --watch cliphist store"
    "swayidle-wrapper"
    "swww-daemon"
  ];
}
