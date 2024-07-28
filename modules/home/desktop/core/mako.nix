{ config, lib, pkgs, ... }:

let
  flags = config.flags.packages.desktop.environment;
in {
  config = lib.mkIf flags.enable {
    xdg.configFile."mako/config".text = lib.generators.toINIWithGlobalSection {} {
      globalSection = {
        sort = "-time";
        layer = "overlay";

        width = 400;
        height = 120;
        margin = "12";
        padding = "12,20";
        borderSize = 2;
        borderRadius = 12;

        borderColor = "#99c0d0";
        backgroundColor = "#2e34407f";

        icons = true;
        maxIconSize = 64;

        defaultTimeout = 5000;
        ignoreTimeout = true;

        font = "sans-serif 12";
      };
  
      sections = {
        "urgency=low" = {
          border-color = "#cccccc";
        };

        "urgency=normal" = {
          border-color = "#99c0d0";
        };

        "urgency=critical" = {
          border-color = "#bf616a";
          default-timeout = 0;
        };
      };
    };
  };
}
