{ config, lib, pkgs, inputs, ... }:

let
  flags = config.flags.packages.desktop.environment.hyprland;
  globalFlags = config.flags;
in {
  config = lib.mkIf flags.enable {
    programs.hyprland = {
      enable = true;
    };
  
    # Additional packages that enhance Hyprland's functionality
    environment.systemPackages = with pkgs; [
      cliphist
      grim
      helvum
      mako
      slurp
      sway-audio-idle-inhibit
      swayidle
      swaylock-effects
      swww
      tofi
      waybar
      wl-clipboard
    ];
  
    security.pam.services.swaylock = {};

    services.blueman.enable = globalFlags.packages.services.bluetooth.enable;
  };
}
