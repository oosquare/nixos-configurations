{ config, lib, pkgs, ... }:

{
  imports = [
    ./cava
    ./mpd-mpris
    ./mpd
    ./mpv
    ./ncmpcpp
  ];

  home.packages = with pkgs; [
    playerctl
  ];
}

