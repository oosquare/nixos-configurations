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
    hasDesktop = flags.packages.desktop.enable;
  in
    lib.mkIf hasDesktop {
      gtk.enable = true;
    };
}
