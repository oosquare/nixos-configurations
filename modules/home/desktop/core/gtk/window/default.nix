{ config, lib, pkgs, ... }:

{
  imports = [
    ./adwaita.nix
    ./orchis.nix
  ];

  # Fallback configurations
  gtk.theme = {
    name = lib.mkDefault "Adwaita";
    package = lib.mkDefault null;
  };
}
