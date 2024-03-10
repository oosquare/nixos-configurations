{ config, lib, pkgs, inputs, ... }@args:

let
  flags = config.flags.packages.desktop.environment.hyprland;
in {
  config = lib.mkIf flags.enable {
    wayland.windowManager.hyprland = {
      enable = true;
      systemd.enable = false;

      package = if flags.dev then
        inputs.hyprland.packages.${pkgs.system}.hyprland
      else
        pkgs.hyprland;
  
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
  };
}
