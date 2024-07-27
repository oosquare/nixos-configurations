{ config, lib, pkgs, ... }:

let
  flags = config.flags.packages.desktop.environment.plasma;
in {
  imports = [
    ./input.nix
    ./keybindings.nix
    ./misc.nix
    ./rule.nix
    ./ui.nix
  ];

  config = lib.mkIf flags.enable {
    programs.plasma.enable = true;
  };
}
