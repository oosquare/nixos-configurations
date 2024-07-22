{ config, lib, pkgs, ... }:

let
  flags = config.flags.packages.cli;
in {
  config = lib.mkIf flags.enable {
    programs.zellij.enable = true;
  
    home.file.".config/zellij/config.kdl".source = pkgs.substitute {
      src = ./config.kdl;
      substitutions = [
        "--replace-fail" "@@%%xdg-config-home%%@@" "${config.xdg.configHome}"
      ];
    };
  
    home.file.".config/zellij/layouts" = {
      source = ./layouts;
      recursive = true;
    };
  };
}
