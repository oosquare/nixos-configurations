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
}
