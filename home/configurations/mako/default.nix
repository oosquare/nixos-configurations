{ config, lib, pkgs, ... }:

{
  home.file.".config/mako/config".source = ./config;
}
