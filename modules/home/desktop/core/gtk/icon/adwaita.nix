{ config, lib, pkgs, ... }:

let
  flags = config.flags;
in {
  config = lib.mkIf (flags.ui.theme.icon == "Adwaita") {
    gtk.iconTheme.name = lib.mkForce "Adwaita";
    gtk.iconTheme.package = lib.mkForce pkgs.gnome.adwaita-icon-theme;
  };
}
