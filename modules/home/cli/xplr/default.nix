{ config, lib, pkgs, ... }:

let
  flags = config.flags.packages.cli;
in {
  config = lib.mkIf flags.enable {
    programs.xplr.enable = true;

    programs.xplr.extraConfig = builtins.readFile ./init.lua;

    programs.xplr.plugins = {
      visual-mode = pkgs.fetchFromGitHub {
        owner = "oo-infty";
        repo = "visual-mode.xplr";
        rev = "c2d7e333ae145b55e0c873a44ee971d2563783cd";
        hash = "sha256-1u6XVXyDi7gwhlKix26wHXPQmDuR/ssi9zDFdq294S4=";
      };
    };
  };
}
