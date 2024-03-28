{ config, lib, pkgs, ... }:

let
  flags = config.flags.packages.desktop.environment;
in {
  config = lib.mkIf flags.enable {
    home.file.".config/waybar/config".source = ./config;
    home.file.".config/waybar/style.css".source = ./style.css;
  };
}
