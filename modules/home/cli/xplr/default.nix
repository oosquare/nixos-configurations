{ config, lib, pkgs, ... }:

let
  flags = config.flags.packages.cli;
in {
  config = lib.mkIf flags.enable {
    programs.xplr.enable = true;

    programs.xplr.extraConfig = builtins.readFile ./init.lua;
  };
}
