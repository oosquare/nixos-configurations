{ config, lib, pkgs, ... }:

let
  flags = config.flags;
in {
  config = lib.mkIf (flags.ui.theme.window == "Adwaita") {
    gtk.theme.name = if flags.ui.theme.mode == "Light" then
      lib.mkForce "Adwaita"
    else if flags.ui.theme.mode == "Dark" then
      lib.mkForce "Adwaita-dark"
    else
      builtins.abort "Unreachable";

    home.sessionVariables = lib.optionalAttrs flags.ui.theme.mode == "Dark" {
      GTK_THEME = "Adwaita-dark";
    };
  };
}
