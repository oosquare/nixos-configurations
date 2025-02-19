{ config, lib, pkgs, ... }:

let
  flags = config.flags.packages.cli;
  cfg = config.programs.zellij;
in {
  programs.zellij.enable = flags.enable;
  programs.zellij.enableBashIntegration = false;
  programs.zellij.enableZshIntegration = false;
  programs.zellij.enableFishIntegration = false;
  
  home.file.".config/zellij/config.kdl".source = lib.mkIf cfg.enable (pkgs.substitute {
    src = ./config.kdl;
    substitutions = [
      "--replace-fail" "@@%%xdg-config-home%%@@" "${config.xdg.configHome}"
    ];
  });

  home.file.".config/zellij/layouts" = lib.mkIf cfg.enable {
    source = ./layouts;
    recursive = true;
  };
}
