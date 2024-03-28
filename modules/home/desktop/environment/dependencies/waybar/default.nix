{ config, lib, pkgs, ... }:

{
  home.file.".config/waybar/config".source = ./config;
  home.file.".config/waybar/style.css".source = ./style.css;
}
