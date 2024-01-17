{ config, pkgs, ... }:

{
  programs.atuin.enable = true;
  home.file.".config/atuin/config.toml".source = ./config.toml;
}
