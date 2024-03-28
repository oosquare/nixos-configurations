{ config, lib, pkgs, ... }:

let
  flags = config.flags.packages.services.proxy;
in {
  config = lib.mkIf flags.enable {
    services.v2raya.enable = true;
  };
}
