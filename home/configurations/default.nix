{ config, pkgs, ... }:

{
  imports = [
    ./alacritty
    ./atuin
    ./fontconfig
    ./fzf
    ./helix
    ./hyprland
    ./mpd
    ./mpd-mpris
    ./ncmpcpp
    ./tofi
    ./waybar
    ./xdg
    ./zsh
  ];
}
