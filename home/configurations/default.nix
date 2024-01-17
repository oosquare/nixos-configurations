{ config, pkgs, ... }:

{
  imports = [
    ./fontconfig
    ./fzf
    ./helix
    ./zsh
  ];
}
