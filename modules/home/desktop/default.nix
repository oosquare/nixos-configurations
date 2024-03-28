{ config, lib, pkgs, ... }:

{
  imports = [
    ./core
    ./environment
    ./communication
    ./multimedia
    ./network
    ./production
  ];
}
