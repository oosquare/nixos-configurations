{ config, lib, pkgs, ... }:

let
  flags = config.flags.packages.desktop;
in {
  imports = [
    ./environment
    ./i18n
  ];

  config = lib.mkIf flags.enable {
    fonts = {
      packages = with pkgs; [
        noto-fonts-color-emoji
        (nerdfonts.override {
          fonts = [ "NerdFontsSymbolsOnly" ];
        })
      ];
    };

    services.xserver.libinput.enable = true;
    services.printing.enable = true;
  };
}
