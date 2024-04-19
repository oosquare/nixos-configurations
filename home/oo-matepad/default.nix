{ config, lib, pkgs, ... }:

{
  imports = [
    # Common modules
    ../../modules/flags
    ../../modules/home
  ];

  home.stateVersion = "24.05";
}
