{ config, lib, pkgs, ... }:

let
  flags = config.flags.packages.desktop.environment.plasma;
in {
  config = lib.mkIf flags.enable {
    programs.plasma.workspace = {
      lookAndFeel = "org.kde.breezedark.desktop";
      iconTheme = "Reversal-blue-dark";
      cursor = {
        theme = "Vimix-cursors";
        size = 24;
      };
    };

    programs.plasma.configFile = {
      kdeglobals.KDE.AnimationDurationFactor = 0.5;

      kwinrc.Desktops.Id_1 = "69ca9663-f8b0-4ff6-928f-6648ca0ffd48";
      kwinrc.Desktops.Id_2 = "cdfc9f63-fc17-4aae-b5ae-b097e000b6c4";
      kwinrc.Desktops.Id_3 = "def8c15a-2c33-4f8b-9b53-680c798c5391";
      kwinrc.Desktops.Id_4 = "519be011-25cc-4ac0-8e3c-1890b9c07f1d";
      kwinrc.Desktops.Id_5 = "49ff0bed-993a-4c28-a510-5a439dd0d123";
      kwinrc.Desktops.Id_6 = "3b968663-e40c-4a52-ad61-33cb4d725e3f";
      kwinrc.Desktops.Id_7 = "c59bcf7e-c192-4e59-b85a-3ac99d7fa030";
      kwinrc.Desktops.Id_8 = "ddf74749-34e5-4ec9-9f42-e8172e353453";
      kwinrc.Desktops.Id_9 = "11b5f9ee-4c82-4189-a713-f9c1e3ed166c";
      kwinrc.Desktops.Number = 9;
    };
  };
}
