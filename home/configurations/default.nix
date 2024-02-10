{ config, pkgs, ... }:

{
  imports = [
    ./alacritty
    ./atuin
    ./fontconfig
    ./fzf
    ./gtk
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
