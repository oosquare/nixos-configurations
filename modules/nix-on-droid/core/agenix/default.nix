{ config, lib, pkgs, ... }:

let
  flags = config.core;
in {
  imports = [
    ./module.nix
  ];

  config = lib.mkIf flags.enable {
    age.enable = true;
  };
}
