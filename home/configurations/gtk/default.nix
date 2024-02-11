{ config, lib, pkgs, flags, ... }:

{
  imports = [
    ./cursor
    ./icon
    ./window
  ];

  gtk.enable = builtins.any (entry: entry.enable == true) (with flags.desktop; [
    gnome
    hyprland
  ]);
}
