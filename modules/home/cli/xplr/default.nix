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
        rev = "c0cb399b5951dfc6759d00105d2c6e1c2c5e3cc0";
        hash = "sha256-ISjwzarbj6kK1nDfkNGHqXOUG3lG5AEXDR6YphBgLmM=";
      };
    };
  };
}
