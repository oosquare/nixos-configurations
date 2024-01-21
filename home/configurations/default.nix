{ config, pkgs, ... }:

{
  imports = [
    ./atuin
    ./fontconfig
    ./fzf
    ./helix
    ./xdg
    ./zsh
  ];
}
