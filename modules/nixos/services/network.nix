{ config, lib, pkgs, ... }:

let
  flags = config.flags.packages.services.network;
in {
  config = lib.mkIf flags.enable {
    networking.networkmanager.enable = true;

    services.tailscale = {
      enable = true;
      authKeyFile = config.age.secrets."tailscale-auth-oo-laptop.age".path;
    };
  };
}
