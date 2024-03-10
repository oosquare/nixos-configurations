{ config, lib, pkgs, ... }:

let
  flags = config.flags;
in {
  config = let
    hasDesktop = flags.packages.desktop.enable;
  in
    lib.mkIf hasDesktop {
      qt.enable = true;
      qt.platformTheme = "qtct";
      qt.style.name = "kvantum";
    };
}
