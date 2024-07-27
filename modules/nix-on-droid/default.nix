{ config, lib, pkgs, ... }:

{
  imports = [
    ./services

    ./agenix-module.nix
    ./cli.nix
  ];

  environment.packages = with pkgs; [
    curl
    helix
    zsh
  ];

  age.enable = true;
}
