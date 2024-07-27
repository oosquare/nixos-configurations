{ config, lib, pkgs, inputs, ... }:

{
  imports = [
    inputs.nur.hmModules.nur
    ./core
    ./cli
    ./desktop

    ./development.nix
  ];
}
