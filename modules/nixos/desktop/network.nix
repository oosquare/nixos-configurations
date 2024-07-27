{ config, lib, pkgs, ... }:

let
  flags = config.flags.packages.desktop.network;
in {
  config = lib.mkIf flags.enable {
    programs.kdeconnect.enable = true;
  };
}

