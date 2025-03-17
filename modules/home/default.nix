{ config, lib, pkgs, inputs, ... }@args:

{
  imports = [
    inputs.nur.modules.homeManager.default
    ./core
    ./cli
    ./desktop
    ./development.nix
  ];

  nixpkgs.overlays = import ../../overlays args;
  nixpkgs.config.allowUnfree = true;

  nixpkgs.config.permittedInsecurePackages = [
    "electron-32.3.3"
  ];

  services.mpd.enable = lib.mkForce false;
  programs.ncmpcpp.enable = lib.mkForce false;
  programs.cava.enable = lib.mkForce false;
}
