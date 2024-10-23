{ config, lib, pkgs, ... }:

let
  flags = config.flags.packages.desktop.multimedia;
in {
  imports = [
    ./cava.nix
    ./mpd.nix
    ./mpv.nix
    ./ncmpcpp.nix
  ];

  config = lib.mkIf flags.enable {
    home.packages = with pkgs; [
      lx-music-desktop
      playerctl
    ];
  };
}

