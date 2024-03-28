{ config, lib, pkgs, ... }:

{
  imports = [
    ./core
    ./cli
    ./desktop
    ./development
    ./services
  ];
}
