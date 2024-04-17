{ config, lib, pkgs, ... }:

{
  imports = [
    # Common modules
    ../../modules/flags
    ../../modules/home

    # System-specific modules
    ./ssh.nix
  ];

  home.stateVersion = "24.05";
}
