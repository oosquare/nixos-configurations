{ config, lib, pkgs, flags, ... }:

lib.optionalAttrs
  (flags.ui.theme.cursor == "Vimix")
  {
    gtk.cursorTheme.name = lib.mkForce "Vimix-cursors";
    gtk.cursorTheme.package = lib.mkForce pkgs.vimix-cursors;
  }
