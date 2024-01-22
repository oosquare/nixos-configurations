{ config, lib, pkgs, flags, ... }:

if flags.desktop.gnome.enable then {
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
} else {}
