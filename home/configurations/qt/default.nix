{ config, lib, pkgs, ... }:

{
  qt.enable = true;
  qt.platformTheme = "qtct";
  qt.style.name = "kvantum";
}
