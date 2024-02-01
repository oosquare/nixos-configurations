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
    ./tofi
    ./waybar
    ./xdg
    ./zsh
  ];
}
