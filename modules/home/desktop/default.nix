{ config, lib, pkgs, ... }:

{
  imports = [
    ./communication.nix
    ./core
    ./environment
    ./multimedia
    ./network
    ./production.nix
  ];
}
