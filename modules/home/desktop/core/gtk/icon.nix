{ config, lib, pkgs, ... }:

let
  flags = config.flags;
in {
  gtk.iconTheme = {
    name = "Adwaita";
    package = pkgs.gnome.adwaita-icon-theme;
  } // lib.optionalAttrs (flags.ui.theme.icon == "Adwaita") {
    name = "Adwaita";
    package = pkgs.gnome.adwaita-icon-theme;
  } // lib.optionalAttrs (flags.ui.theme.icon == "Reversal") {
    name = "Reversal-blue";
    package = pkgs.reversal-icon-theme.override {
      colorVariants = [ "-blue" ];
    };
  };
}

