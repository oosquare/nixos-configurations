{ config, lib, pkgs, ... }:

{
  services.mpd = {
    enable = true;
    network.startWhenNeeded = true;

    extraConfig = ''
      auto_update "yes"
      audio_output {
        type "pipewire"
        name "MPD PipeWire Output"
      }
    '';
  };

}
