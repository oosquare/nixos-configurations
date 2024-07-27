{ config, lib, pkgs, ... }:

let
  locker = pkgs.writeScript
    "swaylock-wrapper"
    (builtins.readFile ../../core/scripts/swaylock-wrapper.sh);

  swayidle-wrapper = pkgs.writeScript
    "swayidle-wrapper"
    (builtins.replaceStrings
      [ "@@%%locker%%@@" ]
      [ "${locker}" ]
      (builtins.readFile ../../core/scripts/swayidle-wrapper.sh));
in {
  exec-once = [
    "fcitx5"
    "waybar"
    "mako"
    "wl-paste --type text --watch cliphist store"
    "${swayidle-wrapper}"
    "swww-daemon"
  ];
}
