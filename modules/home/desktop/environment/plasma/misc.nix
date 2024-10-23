{ config, lib, pkgs, ... }:

{
  programs.plasma.configFile = {
    plasma-localerc.Formats.LANG = "zh_CN.UTF-8";
  };
}
