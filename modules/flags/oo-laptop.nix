{ config, lib, pkgs, constants, ... }:

{
  flags = lib.mkForce {
    ui = {
      font = {
        notoFonts = true;
        sourceCodePro = true;
        emoji = true;
      };
    };
    packages = {
      desktop = {
        environment = {
          gnome = {
            enable = true;
          };

          hyprland = {
            enable = true;
            dev = false;
          };
        };

        communication.enable = true;
        i18n.enable = true;
        multimedia.enable = true;
        network.enable = true;
        production.enable = true;
      };

      development = {
        enable = true;
      };

      services = {
        enable = true;
        bluetooth.enable = true;
        network.enable = true;
        proxy.enable = true;
        sound.enable = true;
        ssh.enable = true;
      };
    };
  };
}
