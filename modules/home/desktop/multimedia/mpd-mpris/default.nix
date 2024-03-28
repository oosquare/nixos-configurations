{ config, lib, pkgs, ... }:

let
  flags = config.flags.packages.desktop.multimedia;
in {
  config = lib.mkIf flags.enable {
    services.mpd-mpris = {
      enable = true;
  
      mpd = {
        network = "unix";
        host = config.mpd.network.listenAddress;
        port = config.mpd.network.port;
      };
    };
  };
}
