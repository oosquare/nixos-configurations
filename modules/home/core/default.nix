{ config, lib, pkgs, ... }:

{
  imports = [
    ./direnv
    ./helix
    ./zsh
  ];
}
