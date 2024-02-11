{ config, lib, pkgs, flags, ... }:

lib.optionalAttrs
  (flags.ui.theme.window == "Adwaita")
  (if flags.ui.theme.mode == "Light" then
    {
      gtk.theme.name = lib.mkForce "Adwaita";
    }
  else if flags.ui.theme.mode == "Dark" then
    {
      gtk.theme.name = lib.mkForce "Adwaita-dark";
      home.sessionVariables.GTK_THEME = "Adwaita-dark";
    }
  else
    (builtins.abort "Invalid value `${flags.ui.theme.mode}` for `flags.ui.theme.mode`"))
