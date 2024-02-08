{ config, lib, pkgs, inputs, flags, ... }@args:

{
  # home.file.".config/hypr/hyprland.conf".source = ./hyprland.conf;
  # home.file.".config/hypr/input.conf".source = ./input.conf;
  # home.file.".config/hypr/output.conf".source = ./output.conf;
  # home.file.".config/hypr/keybindings.conf".source = ./keybindings.conf;
  # home.file.".config/hypr/rules.conf".source = ./rules.conf;
  # home.file.".config/hypr/layout.conf".source = ./layout.conf;
  # home.file.".config/hypr/ui.conf".source = ./ui.conf;
  wayland.windowManager.hyprland.enable = flags.desktop.hyprland.enable;

  wayland.windowManager.hyprland.package = if flags.desktop.hyprland.dev
    then inputs.hyprland.packages.${pkgs.system}.hyprland
    else pkgs.hyprland;

  wayland.windowManager.hyprland.settings = lib.attrsets.mergeAttrsList [
    (import ./environment.nix args)
    (import ./startup.nix args)
    (import ./input.nix args)
    (import ./output.nix args)
    (import ./keybindings.nix args)
    (import ./layout.nix args)
    (import ./rules.nix args)
    (import ./ui.nix args)
  ];
}
