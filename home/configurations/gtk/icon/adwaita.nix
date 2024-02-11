{ config, lib, pkgs, flags, ... }:

lib.optionalAttrs
  (flags.ui.theme.icon == "Adwaita")
  {
    gtk.iconTheme.name = lib.mkForce "Adwaita";
    gtk.iconTheme.package = lib.mkForce pkgs.gnome.adwaita-icon-theme;
  }
