{ config, lib, pkgs, inputs, flags, ... }:

let
  hyprlandFlags = flags.desktop.hyprland;
in {
  programs.hyprland = {
    enable = hyprlandFlags.enable;
    package = if hyprlandFlags.dev
      then inputs.hyprland.packages.${pkgs.system}.hyprland
      else pkgs.hyprland;
  };

  # Additional packages that enhance Hyprland's functionality
  environment.systemPackages = lib.optionals hyprlandFlags.enable (with pkgs; [
    cliphist
    easyeffects
    grim
    helvum
    mako
    slurp
    swaylock-effects
    swww
    tofi
    waybar
    wl-clipboard
  ]);

  security.pam.services.swaylock = {};
}
