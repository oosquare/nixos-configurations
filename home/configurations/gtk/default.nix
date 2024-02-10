{ config, lib, pkgs, ... }:

{
  gtk = {
    enable = true;

    theme = {
      name = "Orchis-Dark";
      package = pkgs.orchis-theme.override {
        tweaks = [ "compact" ];
      };
    };

    iconTheme = {
      name = "Reversal-blue";
      package = pkgs.reversal-icon-theme.override {
        colorVariants = [ "-blue" ];
      };
    };
  };

  home.pointerCursor = {
    gtk.enable = true;
    name = "Vimix-cursors";
    package = pkgs.vimix-cursors;
    size = 24;
  };
}
