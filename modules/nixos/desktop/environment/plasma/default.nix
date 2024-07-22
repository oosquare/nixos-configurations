{ config, lib, pkgs, ... }:

let
  flags = config.flags.packages.desktop.environment.plasma;
in {
  config = lib.mkIf flags.enable {
    services.xserver.enable = true;
  
    services.displayManager.sddm.enable = true;
    services.displayManager.sddm.wayland.enable = true;
    services.desktopManager.plasma6.enable = true;
  };
}

