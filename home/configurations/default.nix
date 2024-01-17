{ config, pkgs, ... }:

{
  imports = [
    ./atuin
    ./fontconfig
    ./fzf
    ./helix
    ./zsh
  ];
}
