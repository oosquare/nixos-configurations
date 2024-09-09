{ config, lib, pkgs, ... }:

let
  flags = config.flags.packages.desktop.environment.plasma;
in {
  config = lib.mkIf flags.enable {
    programs.plasma.window-rules = [
      {
        description = "Transparent Exclude";
        match = {
          window-class = { type = "regex"; value = "firefox|Alacritty|LibreOffice"; };
        };
        apply = {
          opacityactive = { value = "100"; apply = "force"; };
          opacityinactive = { value = "100"; apply = "force"; };
        };
      }
      {
        description = "Transparent";
        match = {};
        apply = {
          opacityactive = { value = "85"; apply = "force"; };
          opacityinactive = { value = "85"; apply = "force"; };
        };
      }
      {
        description = "Startup Maximized";
        match = {
          window-class = { type = "regex"; value = "systemsettings|plasma-systemmonitor"; };
        };
        apply = {
          maximizehoriz = { value = true; apply = "initially"; };
          maximizevert = { value = true; apply = "initially"; };
        };
      }
    ];
  };
}

