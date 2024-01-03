{ config, pkgs, ... }:

{
  home.file.".config/helix/config.toml".source = ./config.toml;
  home.file.".config/helix/themes".source = ./themes;
}
