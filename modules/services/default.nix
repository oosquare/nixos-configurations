{ config, lib, pkgs, ... }:

{
  imports = [
    ./bluetooth
    ./sound
    ./network
    ./proxy
  ];
}
