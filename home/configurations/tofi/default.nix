{ config, lib, pkgs, ... }:

{
  home.file.".config/tofi/config".source = ./config;
}
