{ config, lib, pkgs, ... }:

let
  flags = config.flags.packages.desktop;
in {
  config = lib.mkIf flags.enable {
    qt.enable = true;
    qt.platformTheme = "qtct";
    qt.style.name = "kvantum";
  };
}
