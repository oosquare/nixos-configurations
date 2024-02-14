{ config, lib, pkgs, ... }:

{
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
}
