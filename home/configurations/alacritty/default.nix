{ config, pkgs, ... }:

{
  home.file.".config/alacritty/alacritty.toml".source = ./alacritty.toml;
}
