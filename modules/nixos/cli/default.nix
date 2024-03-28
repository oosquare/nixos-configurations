{ config, lib, pkgs, ... }:

let
  flags = config.flags.packages.cli;
in {
  config = lib.mkIf flags.enable {
    environment.systemPackages = with pkgs; [
      htop
      git
    ];
  };
}
