{ config, lib, pkgs, ... }:

let
  swayidle-wrapper = pkgs.writeScript
    "swayidle-wrapper"
    (builtins.readFile ../dependencies/scripts/swayidle-wrapper.sh);
in {
  exec-once = [
    "fcitx5"
    "waybar"
    "mako"
    "wl-paste --type text --watch cliphist store"
    "swww init"
    "${swayidle-wrapper}"
  ];
}
