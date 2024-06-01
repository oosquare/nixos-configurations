{ config, lib, pkgs, ... }:

let
  flags = config.flags.packages.cli;
  cfg = config.programs.gh;
in {
  config = lib.mkIf flags.enable {
    programs.gh.enable = true;
    programs.gh-dash.enable = true;

    programs.zsh.initExtra = ''
      eval $(${cfg.package}/bin/gh completion -s zsh)
    '';
  };
}
