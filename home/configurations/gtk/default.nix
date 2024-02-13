{ config, lib, pkgs, ... }:

let
  flags = config.flags;
in {
  imports = [
    ./cursor
    ./icon
    ./window
  ];

  config = let
    hasDesktop = builtins.any (entry: entry.enable == true) (with flags.desktop; [
      gnome
      hyprland
    ]);
  in
    lib.mkIf hasDesktop {
      gtk.enable = true;
    };
}
