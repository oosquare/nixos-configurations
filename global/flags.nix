{ config, lib, pkgs, constants, ... }:

{
  imports = [
    ./flags-def.nix
    ./override/${constants.hostname}/flags.nix
  ];

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
        dev = false;
      };
    };
  };
}
