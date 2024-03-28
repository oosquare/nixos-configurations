{ config, lib, pkgs, ... }:

with lib;
let
  flags = config.flags;

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

    options.packages = mkSubOption {
      description = "Package set configurations";

      options.core = mkSubOption {
        description = "Core packages";

        options.enable = mkOption {
          type = types.bool;
          default = true;
        };
      };

      options.cli = mkSubOption {
        description = "CLI packages";

        options.enable = mkOption {
          type = types.bool;
          default = false;
        };
      };

      options.desktop = mkSubOption {
        description = "Desktop packages";

        options.enable = mkOption {
          type = types.bool;
          default = with flags.packages.desktop.environment; builtins.any (x: x.enable) [
            gnome
            hyprland
          ];
        };

        options.environment = mkSubOption {
          description = "Desktop environments";

          options.gnome = mkSubOption {
            description = "The GNOME desktop environment";

            options.enable = mkOption {
              type = types.bool;
              default = false;
            };
          };

          options.hyprland = mkSubOption {
            description = "The Hyprland Wayland compositor";

            options.enable = mkOption {
              type = types.bool;
              default = false;
            };
            
            options.dev = mkOption {
              type = types.bool;
              default = false;
            };
          };
        };

        options.communication = mkSubOption {
          description = "Applications for communication";
      
          options.enable = mkOption {
            type = types.bool;
            default = false;
          };
        };

        options.i18n = mkSubOption {
          description = "Internationalization support";

          options.enable = mkOption {
            type = types.bool;
            default = false;
          };
        };

        options.multimedia = mkSubOption {
          description = "Applications for music, video, etc.";

          options.enable = mkOption {
            type = types.bool;
            default = false;
          };
        };

        options.network = mkSubOption {
          description = "Applications related to network and surfing the Internet";

          options.enable = mkOption {
            type = types.bool;
            default = false;
          };
        };

        options.production = mkSubOption {
          description = "Applications for production";

          options.enable = mkOption {
            type = types.bool;
            default = false;
          };
        };
      };

      options.development = mkSubOption {
        description = "Applications for development";

        options.enable = mkOption {
          type = types.bool;
          default = false;
        };
      };

      options.services = mkSubOption {
        description = "Service packages";

        options.enable = mkOption {
          type = types.bool;
          default = false;
        };

        options.sound = mkSubOption {
          description = "Sound services";

          options.enable = mkOption {
            type = types.bool;
            default = false;
          };
        };

        options.bluetooth = mkSubOption {
          description = "Bluetooth services";

          options.enable = mkOption {
            type = types.bool;
            default = false;
          };
        };

        options.proxy = mkSubOption {
          description = "Proxy services";

          options.enable = mkOption {
            type = types.bool;
            default = false;
          };
        };

        options.network = mkSubOption {
          description = "Network services";

          options.enable = mkOption {
            type = types.bool;
            default = false;
          };
        };
      };
    };
  };
}
