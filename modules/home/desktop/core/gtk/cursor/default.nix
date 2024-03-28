{ config, lib, pkgs, ... }:

{
  imports = [
    ./vimix.nix
  ];

  home.pointerCursor = {
    gtk.enable = true;
    size = 24;
    name = lib.mkDefault "Vimix-cursors";
    package = lib.mkDefault pkgs.vimix-cursors;
  };
}
