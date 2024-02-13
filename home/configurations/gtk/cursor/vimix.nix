{ config, lib, pkgs, ... }:

let
  flags = config.flags;
in {
  config = lib.mkIf (flags.ui.theme.cursor == "Vimix") {
    gtk.cursorTheme.name = lib.mkForce "Vimix-cursors";
    gtk.cursorTheme.package = lib.mkForce pkgs.vimix-cursors;
  };
}
