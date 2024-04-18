{ config, lib, pkgs, ... }:

let
  flags = config.flags.packages.core;
in {
  config = lib.mkIf flags.enable {
    programs.direnv = {
      enable = true;
      nix-direnv.enable = true;
  
      stdlib = builtins.readFile ./stdlib.sh;
    };
  
    home.sessionVariables = {
      DIRENV_LOG_FORMAT = "";
    };
  };
}
