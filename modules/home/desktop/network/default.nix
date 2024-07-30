{ config, lib, pkgs, ... }:

let
  flags = config.flags.packages.desktop.network;
in {
  imports = [
    ./firefox
  ];
}
