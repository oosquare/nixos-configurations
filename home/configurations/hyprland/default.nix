{ config, lib, pkgs, ... }:

{
  home.file.".config/hypr/hyprland.conf".source = ./hyprland.conf;
  home.file.".config/hypr/input.conf".source = ./input.conf;
  home.file.".config/hypr/output.conf".source = ./output.conf;
  home.file.".config/hypr/keybindings.conf".source = ./keybindings.conf;
  home.file.".config/hypr/rules.conf".source = ./rules.conf;
  home.file.".config/hypr/ui.conf".source = ./ui.conf;
}
