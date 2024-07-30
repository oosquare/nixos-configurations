{ config, lib, pkgs, ... }:

let
  flags = config.flags.packages.desktop.environment.plasma;
in {
  imports = [
    ./input.nix
    ./keybindings.nix
    ./misc.nix
    ./rules.nix
    ./ui.nix
  ];

  config = lib.mkIf flags.enable {
    programs.plasma.enable = true;

    home.activation.deleteGtkrc2Backup = lib.hm.dag.entryAfter [ "configure-plasma" ] ''
      run rm $HOME/.gtkrc-2.0.bak || true
    '';
  };
}
