{ config, lib, pkgs, ... }:

{
  imports = [
    ./core
    ./environment
    ./multimedia
    ./network

    ./communication.nix
    ./production.nix
  ];
}
