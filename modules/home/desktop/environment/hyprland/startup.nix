{ config, lib, pkgs, root, ... }:

{
  exec-once = [
    "fcitx5"
    "waybar"
    "mako"
    "wl-paste --type text --watch cliphist store"
    "swayidle-wrapper"
    "swww-daemon"
    "sleep 0.5 && swww img ${root + /assets/wallpapers/milky-way.png}"
  ];
}
