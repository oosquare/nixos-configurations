{ config, lib, pkgs, ... }:

{
  imports = [
    ./core
    ./services

    ./cli.nix
  ];
}
