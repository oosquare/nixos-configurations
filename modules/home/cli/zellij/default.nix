{ config, lib, pkgs, ... }:

{
  programs.zellij.enable = true;

  home.file.".config/zellij/config.kdl".source = pkgs.substitute {
    src = ./config.kdl;
    replacements = [
      "--replace-fail @@%%xdg-config-home%%@@ ${config.xdg.configHome}"
    ];
  };

  home.file.".config/zellij/layouts" = {
    source = ./layouts;
    recursive = true;
  };
}
