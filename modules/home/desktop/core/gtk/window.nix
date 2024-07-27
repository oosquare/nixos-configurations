{ config, lib, pkgs, ... }:

let
  flags = config.flags;
in {
  gtk.theme = {
    name = "Adwaita";
  } // lib.optionalAttrs (flags.ui.theme.window == "Adwaita") {
    name = if flags.ui.theme.mode == "Light"
      then "Adwaita"
      else "Adwaita-dark";
  } // lib.optionalAttrs (flags.ui.theme.window == "Orchis") {
    name = if flags.ui.theme.mode == "Light"
      then "Orchis"
      else "Orchis-Dark";
    package = pkgs.orchis-theme.override {
      tweaks = [ "compact" ];
    };
  };

  home.sessionVariables = lib.optionalAttrs (flags.ui.theme.mode == "Dark") {
    GTK_THEME = "Adwaita-dark";
  };
}
