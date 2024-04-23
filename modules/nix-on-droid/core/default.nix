{ config, lib, pkgs, ... }:

let
  flags = config.flags.packages.core;
in {
  imports = [
    ./agenix
  ];

  config = lib.mkIf flags.enable {
    environment.packages = with pkgs; [
      curl
      helix
      zsh
    ];
  };
}
