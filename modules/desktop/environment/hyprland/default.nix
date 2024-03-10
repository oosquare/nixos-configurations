{ config, lib, pkgs, inputs, ... }:

let
  flags = config.flags.packages.desktop.environment.hyprland;
in {
  config = lib.mkIf flags.enable {
    programs.hyprland = {
      enable = true;
      package = if flags.dev then
        inputs.hyprland.packages.${pkgs.system}.hyprland
      else
        pkgs.hyprland;
    };
  
    # Additional packages that enhance Hyprland's functionality
    environment.systemPackages = with pkgs; [
      cliphist
      easyeffects
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
  };
}
