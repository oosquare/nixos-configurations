{ config, lib, pkgs, ... }:

let
  flags = config.flags.packages.desktop;
in {
  imports = [
    ./cursor.nix
    ./icon.nix
    ./window.nix
  ];

  config = lib.mkIf flags.enable {
    gtk.enable = true;
  };
}
