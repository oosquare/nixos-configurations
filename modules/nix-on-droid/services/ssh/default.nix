{ config, lib, pkgs, ... }:

let
  flags = config.flags.packages.services.ssh;
in {
  imports = [
    ./module.nix
  ];

  config = lib.mkIf flags.enable {
    services.ssh.enable = true;
  };
}
