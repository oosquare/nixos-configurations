{ config, lib, pkgs, constants, ... }:

let
  flags = config.flags.packages.cli;
in {
  programs.git = {
    enable = flags.enable;
    userName = constants.username;
    userEmail = constants.email;
  };
}
