{ config, lib, pkgs, ... }:

let
  flags = config.flags.packages.desktop.environment.plasma;
  cfg = config.programs.plasma;
in {
  imports = [
    ./input.nix
    ./keybindings.nix
    ./misc.nix
    ./rules.nix
    ./ui.nix
  ];

  programs.plasma.enable = flags.enable;
  # programs.plasma.overrideConfig = true;

  home.activation.deleteGtkrc2Backup = lib.mkIf cfg.enable (lib.hm.dag.entryAfter [ "configure-plasma" ] ''
    run rm $HOME/.gtkrc-2.0.bak || true
  '');
}
