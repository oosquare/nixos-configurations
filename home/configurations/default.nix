{ config, pkgs, ... }:

{
  imports = [
    ./alacritty
    ./atuin
    ./cava
    ./fontconfig
    ./fzf
    ./gtk
    ./helix
    ./hyprland
    ./mako
    ./mpd
    ./mpd-mpris
    ./ncmpcpp
    ./qt
    ./tofi
    ./waybar
    ./xdg
    ./zsh
  ];
}
