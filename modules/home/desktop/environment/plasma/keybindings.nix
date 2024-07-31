{ config, lib, pkgs, ... }:

let
  flags = config.flags.packages.desktop.environment.plasma;
in {
  config = lib.mkIf flags.enable {
    programs.plasma.shortcuts = {
      ksmserver."Lock Session" = [ "Meta+Shift+L" "Screensaver" ];
      ksmserver."LogOut" = "Meta+M";

      kwin."ExposeAll" = [ "Launch (C)" "Meta+V" ];
      kwin."Switch to Desktop 1" = "Meta+1";
      kwin."Switch to Desktop 2" = "Meta+2";
      kwin."Switch to Desktop 3" = "Meta+3";
      kwin."Switch to Desktop 4" = "Meta+4";
      kwin."Switch to Desktop 5" = "Meta+5";
      kwin."Switch to Desktop 6" = "Meta+6";
      kwin."Switch to Desktop 7" = "Meta+7";
      kwin."Switch to Desktop 8" = "Meta+8";
      kwin."Window Close" = [ "Alt+F4" "Meta+C" ];
      kwin."Window Maximize" = "Meta+F";
      kwin."Window One Desktop Down" = "Meta+Shift+Down";
      kwin."Window One Desktop Up" = "Meta+Shift+Up";
      kwin."Window One Desktop to the Left" = "Meta+Shift+Left";
      kwin."Window One Desktop to the Right" = "Meta+Shift+Right";
      kwin."Window to Desktop 1" = "Meta+!";
      kwin."Window to Desktop 2" = "Meta+@";
      kwin."Window to Desktop 3" = "Meta+#";
      kwin."Window to Desktop 4" = "Meta+$";
      kwin."Window to Desktop 5" = "Meta+%";
      kwin."Window to Desktop 6" = "Meta+^";
      kwin."Window to Desktop 7" = "Meta+&";
      kwin."Window to Desktop 8" = "Meta+*";
      kwin."Window to Next Screen" = "none";
      kwin."Window to Previous Screen" = "none";
      kwin."Overview" = "Meta+Tab";

      plasmashell."activate task manager entry 1" = "none";
      plasmashell."activate task manager entry 2" = "none";
      plasmashell."activate task manager entry 3" = "none";
      plasmashell."activate task manager entry 4" = "none";
      plasmashell."activate task manager entry 5" = "none";
      plasmashell."activate task manager entry 6" = "none";
      plasmashell."activate task manager entry 7" = "none";
      plasmashell."activate task manager entry 8" = "none";
      plasmashell."stop current activity" = "none";
      plasmashell."manage activities" = "none";
      plasmashell."show-on-mouse-pos" = "Meta+A";
      plasmashell."next activity" = [];

      "services/Alacritty.desktop".New = "Meta+Q";
      "services/firefox.desktop".new-private-window = "Meta+Shift+W";
      "services/firefox.desktop".new-window = "Meta+W";
      "services/org.kde.krunner.desktop"._launch = [ "Search" "Alt+F2" "Meta+Space" ];
      "services/org.kde.spectacle.desktop".ActiveWindowScreenShot = "Meta+Ctrl+S";
      "services/org.kde.spectacle.desktop".RectangularRegionScreenShot = "Meta+Shift+S";
      "services/org.kde.spectacle.desktop".FullScreenScreenShot = "Meta+S";
      "services/org.kde.spectacle.desktop".WindowUnderCursorScreenShot = "Meta+Alt+S";
      "services/org.kde.spectacle.desktop".RecordRegion = "Meta+Shift+R";
      "services/org.kde.spectacle.desktop".RecordWindow = "Meta+Ctrl+R";
      "services/org.kde.spectacle.desktop".RecordScreen = "Meta+R";
      "services/org.kde.spectacle.desktop"._launch = "Print";
    };
  };
}
