{ config, lib, pkgs, ... }:

{
  imports = [
    ./core
    ./environment
    ./multimedia

    ./communication.nix
    ./network.nix
    ./production.nix
  ];
}
