{ config, lib, pkgs, inputs, ... }:

{
  imports = [
    inputs.nur.modules.homeManager.default
    ./core
    ./cli
    ./desktop
    ./development.nix
  ];

  services.mpd.enable = lib.mkForce false;
  programs.ncmpcpp.enable = lib.mkForce false;
  programs.cava.enable = lib.mkForce false;
}
