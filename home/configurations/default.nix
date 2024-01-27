{ config, pkgs, ... }:

{
  imports = [
    ./alacritty
    ./atuin
    ./fontconfig
    ./fzf
    ./helix
    ./hyprland
    ./xdg
    ./zsh
  ];
}
