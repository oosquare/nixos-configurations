{ config, lib, pkgs, inputs, flags, ... }@args:

{
  wayland.windowManager.hyprland.enable = flags.desktop.hyprland.enable;

  wayland.windowManager.hyprland.package = if flags.desktop.hyprland.dev
    then inputs.hyprland.packages.${pkgs.system}.hyprland
    else pkgs.hyprland;

  wayland.windowManager.hyprland.systemd.enable = false;

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
