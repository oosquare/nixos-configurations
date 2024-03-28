{ config, lib, pkgs, ... }:

let
  flags = config.flags.packages.core;
in {
  config = lib.mkIf flags.enable {
    programs.direnv = {
      enable = true;
      nix-direnv.enable = true;
  
      stdlib = ''
        source ~/.scripts/utilities/direnv/cache-dir.sh
      '';
    };
  
    home.file.".scripts/utilities/direnv/cache-dir.sh".source = ./cache-dir.sh;
  
    home.sessionVariables = {
      DIRENV_LOG_FORMAT = "";
    };
  };
}
