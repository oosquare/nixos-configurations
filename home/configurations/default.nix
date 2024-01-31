{ config, pkgs, ... }:

{
  imports = [
    ./alacritty
    ./atuin
    ./fontconfig
    ./fzf
    ./helix
    ./hyprland
    ./tofi
    ./waybar
    ./xdg
    ./zsh
  ];
}
