{ config, lib, pkgs, ... }:

let
  flags = config.flags.packages.desktop.multimedia;
in {
  imports = [
    ./cava
    ./mpd-mpris
    ./mpd
    ./mpv
    ./ncmpcpp
  ];

  config = lib.mkIf flags.enable {
    home.packages = with pkgs; [
      playerctl
    ];
  };
}

