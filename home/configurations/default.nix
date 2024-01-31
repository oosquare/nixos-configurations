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
    ./ncmpcpp
    ./tofi
    ./waybar
    ./xdg
    ./zsh
  ];
}
