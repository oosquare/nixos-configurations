{ config, pkgs, ... }:

{
  imports = [
    ./alacritty
    ./atuin
    ./cava
    ./direnv
    ./fontconfig
    ./fzf
    ./git
    ./gnupg
    ./gtk
    ./helix
    ./hyprland
    ./mako
    ./mpd
    ./mpd-mpris
    ./mpv
    ./ncmpcpp
    ./qt
    ./ssh
    ./tofi
    ./waybar
    ./xdg
    ./zellij
    ./zsh
  ];
}
