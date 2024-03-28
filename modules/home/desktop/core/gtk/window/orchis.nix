{ config, lib, pkgs, ... }:

let
  flags = config.flags;
in {
  config = lib.mkIf (flags.ui.theme.window == "Orchis") {
    gtk.theme.name = if flags.ui.theme.mode == "Light" then
      lib.mkForce "Orchis"
    else if flags.ui.theme.mode == "Dark" then
      lib.mkForce "Orchis-Dark"
    else
      builtins.abort "Unreachable";

    gtk.theme.package = lib.mkForce (pkgs.orchis-theme.override {
      tweaks = [ "compact" ];
    });
  };
}
