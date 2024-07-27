{ config, lib, pkgs, ... }:

{
  imports = [
    ./bluetooth.nix
    ./sound.nix
    ./network.nix
    ./proxy.nix
    ./ssh.nix
  ];
}
