{ config, lib, pkgs, ... }:

let
  flags = config.flags.packages.desktop.multimedia;
in {
  config = lib.mkIf flags.enable {
    services.mpd = {
      enable = true;
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
  };
}
