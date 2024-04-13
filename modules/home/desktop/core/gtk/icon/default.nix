{ config, lib, pkgs, ... }:

{
  imports = [
    ./adwaita.nix
    ./reversal.nix
  ];

  # Fallback configurations
  gtk.iconTheme = {
    name = lib.mkDefault "Adwaita";
    package = lib.mkDefault pkgs.gnome.adwaita-icon-theme;
  };
}

