{ config, lib, pkgs, ... }:

with lib;
let
  flags = config.flags;
in {
  options.flags = {
    ui = {
      colorscheme = mkOption {
        description = "Colorscheme for editors, terminals and so on.";
        type = types.enum [ "One Dark" "Tokyo Night Storm" ];
      };

      font = {
        notoFonts = mkOption {
          type = types.bool;
          default = false;
        };

        sourceCodePro = mkOption {
          type = types.bool;
          default = false;
        };

        emoji = mkOption {
          type = types.bool;
          default = false;
        };
      };

      theme = {
        window = mkOption {
          description = "The name of a window theme";
          type = types.enum [ "Adwaita" "Orchis" ];
        };

        icon = mkOption {
          description = "The name of a icon theme.";
          type = types.enum [ "Adwaita" "Reversal" ];
        };

        cursor = mkOption {
          description = "The name of a cursor theme.";
          type = types.enum [ "Vimix" ];
        };

        mode = mkOption {
          description = "Whether to enable the dark mode.";
          type = types.enum [ "Light" "Dark" ];
        };
      };
    };

    packages = {
      core = {
        enable = mkOption {
          type = types.bool;
          default = true;
        };
      };

      cli = {
        enable = mkOption {
          type = types.bool;
          default = false;
        };
      };

      desktop = {
        enable = mkOption {
          type = types.bool;
          default = flags.packages.desktop.environment.enable;
        };

        environment = {
          enable = mkOption {
            type = types.bool;
            default = with flags.packages.desktop.environment; builtins.any (x: x.enable) [
              gnome
              hyprland
            ];
          };

          gnome = {
            enable = mkOption {
              type = types.bool;
              default = false;
            };
          };

          hyprland = {
            enable = mkOption {
              type = types.bool;
              default = false;
            };
            
            dev = mkOption {
              type = types.bool;
              default = false;
            };
          };
        };

        communication = {
          enable = mkOption {
            type = types.bool;
            default = false;
          };
        };

        i18n = {
          enable = mkOption {
            type = types.bool;
            default = false;
          };
        };

        multimedia = {
          enable = mkOption {
            type = types.bool;
            default = false;
          };
        };

        network = {
          enable = mkOption {
            type = types.bool;
            default = false;
          };
        };

        production = {
          enable = mkOption {
            type = types.bool;
            default = false;
          };
        };
      };

      development = {
        enable = mkOption {
          type = types.bool;
          default = false;
        };
      };

      services = {
        enable = mkOption {
          type = types.bool;
          default = false;
        };

        sound = {
          enable = mkOption {
            type = types.bool;
            default = false;
          };
        };

        bluetooth = {
          enable = mkOption {
            type = types.bool;
            default = false;
          };
        };

        proxy = {
          enable = mkOption {
            type = types.bool;
            default = false;
          };
        };

        network = {
          enable = mkOption {
            type = types.bool;
            default = false;
          };
        };

        ssh = {
          enable = mkOption {
            type = types.bool;
            default = false;
          };
        };
      };
    };
  };
}
