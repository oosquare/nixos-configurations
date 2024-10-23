{ config, lib, pkgs, ... }:

let
  flags = config.flags.packages.desktop.multimedia;
  cfg = config.services.mpd;
in {
  services.mpd = {
    enable = flags.enable;
    network.startWhenNeeded = true;

    extraConfig = ''
      auto_update "yes"
      restore_paused "yes"

      audio_output {
        type "pipewire"
        name "MPD PipeWire Output"
      }

      audio_output {
        type "fifo"
        name "MPD Visualizer Data FIFO"
        path "/tmp/mpd-visualizer-data.fifo"
        format "44100:16:2"
      }
    '';
  };

  services.mpd-mpris = {
    enable = cfg.enable;

    mpd = {
      network = "unix";
      host = config.services.mpd.network.listenAddress;
      port = config.services.mpd.network.port;
    };
  };
}
