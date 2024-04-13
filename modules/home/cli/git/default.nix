{ config, lib, pkgs, constants, ... }:

let
  flags = config.flags.packages.cli;
in {
  config = lib.mkIf flags.enable {
    programs.git = {
      enable = true;
      userName = constants.username;
      userEmail = constants.email;
    };
  };
}
