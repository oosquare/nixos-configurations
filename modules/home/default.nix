{ config, lib, pkgs, inputs, ... }:

{
  imports = [
    inputs.nur.hmModules.nur
    ./core
    ./cli
    ./desktop
    ./development.nix
  ];

  services.mpd.enable = lib.mkForce false;
  programs.ncmpcpp.enable = lib.mkForce false;
}
