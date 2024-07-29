{ config, lib, pkgs, inputs, ... }:

{
  imports = [
    ./core
    ./services

    ./cli.nix
  ];

  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';

  nix.registry.nixpkgs.flake = inputs.nixpkgs;
}
