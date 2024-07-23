{ config, lib, pkgs, ... }:

let
  flags = config.flags.packages.desktop;
in {
  imports = [
    ./core
    ./environment
    ./i18n
  ];

  config = lib.mkIf flags.enable {
    services.libinput.enable = true;
    services.printing.enable = true;
  };
}
