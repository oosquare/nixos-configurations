{ config, lib, pkgs, constants, ... }:

{
  flags = lib.mkForce {
    packages = {
      cli.enable = true;

      services = {
        ssh.enable = true;
      };
    };
  };
}
