{ config, lib, pkgs, ... }:

{
  services.mpd-mpris = {
    enable = true;

    mpd = {
      network = "unix";
      host = config.mpd.network.listenAddress;
      port = config.mpd.network.port;
    };
  };
}
