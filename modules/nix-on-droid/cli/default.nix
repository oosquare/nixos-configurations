{ config, lib, pkgs, ... }:

let
  flags = config.flags.packages.cli;
in {
  config = lib.mkIf flags.enable {
    environment.packages = with pkgs; [
      git
    ];
  };
}
