{ config, lib, pkgs, ... }:

let
  flags = config.flags.packages.core;
in {
  imports = [
    ./module.nix
  ];

  config = lib.mkIf flags.enable {
    age.enable = true;
  };
}
