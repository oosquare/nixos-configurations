{ config, lib, pkgs, constants, inputs, ... }@args:

{
  imports = [
    ./cli.nix
    ./core.nix
    ./desktop
    ./development.nix
    ./services
  ];

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  nix.settings.trusted-users = [ constants.username ];

  nix.gc = {
    automatic = true;
    dates = "daily";
    options = "--delete-older-than 7d";
  };

  nix.optimise = {
    automatic = true;
    dates = [ "weekly" ];
  };

  nixpkgs.overlays = import ../../overlays args;
  nixpkgs.config.allowUnfree = true;

  nix.registry.nixpkgs.flake = inputs.nixpkgs;
  environment.etc."nix/inputs/nixpkgs".source = "${inputs.nixpkgs}";
  nix.settings.nix-path = lib.mkForce "nixpkgs=/etc/nix/inputs/nixpkgs";
}
