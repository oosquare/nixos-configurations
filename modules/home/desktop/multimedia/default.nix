{ config, lib, pkgs, inputs, ... }:

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
      inputs.nur.packages.${pkgs.system}.lx-music-desktop
      playerctl
    ];
  };
}

