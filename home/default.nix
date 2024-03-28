{ config, lib, pkgs, inputs, constants, ... }:

{
  imports = [
    ./scripts
    ./configurations
    ../modules/flags
    ../modules/home
  ];

  home.username = constants.username;
  home.homeDirectory = "/home/${config.home.username}";

  home.stateVersion = "24.05";

  programs.home-manager.enable = true;
}
