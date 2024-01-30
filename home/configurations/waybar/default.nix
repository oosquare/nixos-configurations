{ config, lib, pkgs, ... }:

{
  home.file.".config/waybar/config".source = ./config;
}
