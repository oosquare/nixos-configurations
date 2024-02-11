{ config, lib, pkgs, flags, ... }:

lib.optionalAttrs
  (flags.ui.theme.window == "Orchis")
  (if flags.ui.theme.mode == "Light" then
    {
      gtk.theme.name = lib.mkForce "Orchis";
      gtk.theme.package = lib.mkForce (pkgs.orchis-theme.override {
        tweaks = [ "compact" ];
      });
    }
  else if flags.ui.theme.mode == "Dark" then
    {
      gtk.theme.name = lib.mkForce "Orchis-Dark";
      gtk.theme.package = lib.mkForce (pkgs.orchis-theme.override {
        tweaks = [ "compact" ];
      });
    }
  else
    (builtins.abort "Invalid value `${flags.ui.theme.mode}` for `flags.ui.theme.mode`"))
