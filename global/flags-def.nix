{ config, lib, pkgs, ... }:

with lib;
let
  mkSubOption = { description, options }: mkOption {
    inherit description;
    type = (types.submodule {
      inherit options;
    });
  };
in {
  options.flags = mkSubOption {
    description = ''
      Global flags which control various features across different applications
      and systems, aiming to easily switch configurations within a place.
    '';

    options.ui = mkSubOption {
      description = "UI-related flags, including CLI and GUI.";

      options.colorscheme = mkOption {
        description = "Colorscheme for editors, terminals and so on.";
        type = types.enum [ "One Dark" "Tokyo Night Storm" ];
      };

      options.theme = mkSubOption {
        description = "Decorations of different GUI components.";

        options.window = mkOption {
          description = "The name of a window theme";
          type = types.enum [ "Adwaita" "Orchis" ];
        };

        options.icon = mkOption {
          description = "The name of a icon theme.";
          type = types.enum [ "Adwaita" "Reversal" ];
        };

        options.cursor = mkOption {
          description = "The name of a cursor theme.";
          type = types.enum [ "Vimix" ];
        };

        options.mode = mkOption {
          description = "Whether to enable the dark mode.";
          type = types.enum [ "Light" "Dark" ];
        };
      };
    };

    options.desktop = mkSubOption {
      description = "Desktop environments, window managers or Wayland compositors.";

      options.gnome = mkSubOption {
        description = "The GNOME desktop environemt.";

        options.enable = mkOption {
          description = "Whether to enable GNOME.";
          type = types.bool;
          default = false;
        };
      };

      options.hyprland = mkSubOption {
        description = "The Hyprland Wayland compositor.";

        options.enable = mkOption {
          description = "Whether to enable Hyprland.";
          type = types.bool;
          default = false;
        };

        options.dev = mkOption {
          description = "Whether to use the development version.";
          type = types.bool;
          default = false;
        };
      };
    };
  };
}
