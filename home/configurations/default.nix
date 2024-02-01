{ config, pkgs, ... }:

{
  imports = [
    ./alacritty
    ./atuin
    ./fontconfig
    ./fzf
    ./helix
    ./hyprland
    ./mako
    ./mpd
    ./mpd-mpris
    ./ncmpcpp
    ./tofi
    ./waybar
    ./xdg
    ./zsh
  ];
}
