{ config, lib, pkgs, ... }:

let
  flags = config.flags.packages.desktop.environment.plasma;
in {
  config = lib.mkIf flags.enable {
    programs.plasma.window-rules = [
      {
        description = "Transparent Exclude";
        match = {
          window-class.value = "^.*(firefox|Alacritty).*$";
          window-class.type = "regex";
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
    ];
  };
}

