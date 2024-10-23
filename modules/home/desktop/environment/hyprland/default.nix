{ config, lib, pkgs, inputs, ... }@args:

let
  flags = config.flags.packages.desktop.environment.hyprland;
in {
  wayland.windowManager.hyprland = {
    enable = flags.enable;
    systemd.enable = false;

    settings = lib.attrsets.mergeAttrsList [
      (import ./environment.nix args)
      (import ./startup.nix args)
      (import ./input.nix args)
      (import ./output.nix args)
      (import ./keybindings.nix args)
      (import ./layout.nix args)
      (import ./rules.nix args)
      (import ./ui.nix args)
    ];
  };
}
