{ config, lib, pkgs, ... }:

let
  flags = config.flags.packages.desktop.environment.plasma;
in {
  config = lib.mkIf flags.enable {
    programs.plasma.workspace = {
      lookAndFeel = "org.kde.breezedark.desktop";
      theme = "Orchis-dark";
      colorScheme = "OrchisDark";
      iconTheme = "Reversal-blue-dark";
      cursor = {
        theme = "Vimix-cursors";
        size = 24;
      };
    };

    programs.plasma.panels = lib.singleton {
      alignment = "center";
      location = "bottom";
      height = 32;
      lengthMode = "fit";
      floating = true;
      hiding = "dodgewindows";

      widgets = let
        tag = name: value: { ${name} = value; };
      in [
        (tag "kickoff" {
          icon = "nix-snowflake-white";
        })
        (tag "iconTasks" {
          launchers = [
            "applications:systemsettings.desktop"
            "preferred://filemanager"
            "applications:Alacritty.desktop"
            "preferred://browser"
          ];
        })
        (tag "systemTray" {
          icons = {
            scaleToFit = false;
            spacing = "small";
          };

          items = {
            shown = [
              "org.kde.plasma.brightness"
              "org.kde.plasma.networkmanagement"
              "org.kde.plasma.volume"
            ];

            hidden = [
              "blueman"
              "org.kde.plasma.bluetooth"
              "org.kde.plasma.keyboardlayout"
              "org.kde.plasma.clipboard"
              "org.kde.plasma.manage-inputmethod"
              "Fcitx"
              "KeePassXC"
            ];
          };
        })
        (tag "digitalClock" {
          date = {
            enable = true;
            format = "isoDate";
            position = "belowTime";
          };

          time = {
            showSeconds = "onlyInTooltip";
            format = "24h";
          };
        })
        "org.kde.plasma.showdesktop"
      ];
    };

    programs.plasma.kwin.virtualDesktops = rec {
      number = 8;
      names = builtins.map (x: "Desktop ${builtins.toString x}") (lib.range 1 number);
    };

    programs.plasma.kwin.effects = {
      dimAdminMode.enable = true;
      translucency.enable = false;
      blur.enable = true;
      wobblyWindows.enable = true;
    };

    programs.plasma.kwin.nightLight = {
      enable = true;
      mode = "times";
      temperature = { day = 6500; night = 4500; };
      time = { evening = "18:00"; morning = "06:00"; };
      transitionTime = 30;
    };

    programs.plasma.configFile = {
      kdeglobals.KDE.AnimationDurationFactor = 0.5;

      kwinrc.Plugins.desktopchangeosdEnabled = true;
      kwinrc.Script-desktopchangeosd.PopupHideDelay = 250;

      plasmanotifyrc.Notifications.PopupPosition = "BottomRight";

      systemsettingsrc.systemsettings_sidebar_mode.HighlightNonDefaultSettings = true;
    };
  };
}
