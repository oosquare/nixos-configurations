{ config, lib, pkgs, ... }:

let
  flags = config.flags.packages.cli;
in {
  programs.xplr.enable = flags.enable;

  programs.xplr.extraConfig = builtins.readFile ./init.lua;

  programs.xplr.plugins = {
    visual-mode = pkgs.fetchFromGitHub {
      owner = "oosquare";
      repo = "visual-mode.xplr";
      rev = "c2d7e333ae145b55e0c873a44ee971d2563783cd";
      hash = "sha256-1u6XVXyDi7gwhlKix26wHXPQmDuR/ssi9zDFdq294S4=";
    };
  };
}
