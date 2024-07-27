{ config, lib, pkgs, ... }:

{
  imports = [
    ./ssh-module.nix
    ./ssh.nix
  ];
}
