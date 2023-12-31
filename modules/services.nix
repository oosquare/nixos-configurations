{ config, lib, pkgs, ... }:

{
	# CUPS
	# services.printing.enable = true;

	# Sound
  sound.enable = true;

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
  };

  hardware.pulseaudio.enable = false;

  # Proxy
  services.v2raya.enable = true;

  # Libinput
  services.xserver.libinput.enable = true;
}
