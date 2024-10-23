{ config, lib, pkgs, ... }:

let
  flags = config.flags.packages.core;
  cfg = config.programs.direnv;
in {
  programs.direnv = {
    enable = flags.enable;
    nix-direnv.enable = true;

    stdlib = builtins.readFile ./stdlib.sh;
  };

  home.sessionVariables = lib.mkIf cfg.enable {
    DIRENV_LOG_FORMAT = "";
  };
}
