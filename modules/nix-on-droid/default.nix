{ config, lib, pkgs, ... }:

{
  imports = [
    ./core
    ./cli
    ./services
  ];
}
