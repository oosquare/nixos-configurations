{ config, lib, pkgs, ... }:

let
  flags = config.flags;
in {
  config = let
    hasDesktop = builtins.any (entry: entry.enable == true) (with flags.desktop; [
      gnome
      hyprland
    ]);
  in
    lib.mkIf hasDesktop {
      qt.enable = true;
      qt.platformTheme = "qtct";
      qt.style.name = "kvantum";
    };
}
