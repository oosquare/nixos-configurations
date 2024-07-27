{ config, lib, pkgs, ... }:

let
  flags = config.flags.packages.desktop;
  hasPlasma = flags.environment.plasma.enable;
in {
  config = lib.mkIf flags.enable {
    home.packages = with pkgs; [
      kdePackages.qtstyleplugin-kvantum
    ] ++ lib.optionals (!hasPlasma) (with pkgs; [
      qt6ct
    ]);

    home.sessionVariables = {
      QT_QPA_PLATFORMTHEME = if hasPlasma then "kde" else "qt6ct";
      QT_STYLE_OVERRIDE = "kvantum";
    };
  };
}
