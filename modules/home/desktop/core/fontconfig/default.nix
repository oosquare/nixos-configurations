{ config, lib, pkgs, ... }:

let
  flags = config.flags.packages.desktop;
in {
  config = lib.mkIf flags.enable {
    home.file.".config/fontconfig/fonts.conf".source = ./fonts.conf;
  };
}
