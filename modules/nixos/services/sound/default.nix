{ config, lib, pkgs, ... }:

let
  flags = config.flags.packages.services.sound;
in {
  config = lib.mkIf flags.enable {
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };

    security.rtkit.enable = true;
    hardware.pulseaudio.enable = false;
  };
}
