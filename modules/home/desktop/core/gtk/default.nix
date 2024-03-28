{ config, lib, pkgs, ... }:

let
  flags = config.flags.packages.desktop;
in {
  imports = [
    ./cursor
    ./icon
    ./window
  ];

  config = lib.mkIf flags.enable {
    gtk.enable = true;
  };
}
