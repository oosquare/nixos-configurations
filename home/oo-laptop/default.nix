{ config, lib, pkgs, constants, ... }:

{
  imports = [
    # Common modules
    ../../modules/flags
    ../../modules/home
  ];

  home.username = constants.username;
  home.homeDirectory = "/home/${config.home.username}";

  programs.home-manager.enable = true;

  home.stateVersion = "24.05";
}
