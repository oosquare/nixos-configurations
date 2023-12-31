{ config, lib, pkgs, ... }:

{
  # X11
  services.xserver.enable = true;

  # GNOME
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
}
