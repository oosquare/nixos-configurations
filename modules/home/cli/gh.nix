{ config, lib, pkgs, ... }:

let
  flags = config.flags.packages.cli;
  cfg = config.programs.gh;
in {
  programs.gh.enable = flags.enable;
  programs.gh-dash.enable = cfg.enable;

  programs.zsh.initExtra = ''
    eval $(${cfg.package}/bin/gh completion -s zsh)
  '';
}
