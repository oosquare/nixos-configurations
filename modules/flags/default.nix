{ config, lib, pkgs, constants, ... }:

{
  imports = [
    ./declaration.nix
    ./${constants.hostname}.nix
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

    packages = {
      core = {
        enable = true;
      };

      cli = {
        enable = true;
      };
    };
  };
}
