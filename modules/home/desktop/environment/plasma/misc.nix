{ config, lib, pkgs, ... }:

let
  flags = config.flags.packages.desktop.environment.plasma;
in {
  config = lib.mkIf flags.enable {
    programs.plasma.configFile = {
      plasma-localerc.Formats.LANG = "zh_CN.UTF-8";
    };
  };
}
