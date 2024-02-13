{ config, lib, pkgs, ... }:

{
  imports = [ ./flags-def.nix ];

  flags = {
    ui = {
      colorscheme = "One Dark";

      theme = {
        window = "Orchis";
        icon = "Reversal";
        cursor = "Vimix";
        mode = "Dark";
      };
    };

    desktop = {
      gnome = {
        enable = true;
      };

      hyprland = {
        enable = true;
        dev = true;
      };
    };
  };
}
