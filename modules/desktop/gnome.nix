{ config, lib, pkgs, ... }:

let
  flags = config.flags.packages.desktop.environment.gnome;
in {
  config = lib.mkIf flags.enable {
    services.xserver.enable = true;
  
    services.xserver.displayManager.gdm.enable = true;
    services.xserver.desktopManager.gnome.enable = true;
  
    environment.systemPackages = with pkgs; [
      gnomeExtensions.kimpanel
      gnomeExtensions.caffeine
      gnomeExtensions.quick-settings-tweaker
      gnomeExtensions.appindicator
      gnomeExtensions.clipboard-indicator
      gnomeExtensions.coverflow-alt-tab
    ];
  
    services.udev.packages = with pkgs; [ gnome.gnome-settings-daemon ];
  };
}
