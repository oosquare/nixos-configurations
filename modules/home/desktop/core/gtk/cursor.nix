{ config, lib, pkgs, ... }:

let
  flags = config.flags;
in {
  home.pointerCursor = {
    gtk.enable = config.gtk.enable;
    size = 24;
    name = "Vimix-cursors";
    package = pkgs.vimix-cursors;
  } // lib.optionalAttrs (flags.ui.theme.cursor == "Vimix") {
    name = "Vimix-cursors";
    package = pkgs.vimix-cursors;
  };
}
