{ config, lib, pkgs, ... }:

let
  locker = pkgs.writeScript
    "swaylock-wrapper"
    (builtins.readFile ../dependencies/scripts/swaylock-wrapper.sh);

  swayidle-wrapper = pkgs.writeScript
    "swayidle-wrapper"
    (builtins.replaceStrings
      [ "@@%%locker%%@@" ]
      [ "${locker}" ]
      (builtins.readFile ../dependencies/scripts/swayidle-wrapper.sh));
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
