{ config, lib, pkgs, ... }:

let
  flags = config.flags.packages.desktop.environment.plasma;
in {
  config = lib.mkIf flags.enable {
    programs.plasma.input = {
      keyboard = {
        layouts = [ "us" ];
        repeatDelay = 250;
      };

      mice = lib.singleton {
        enable = true;
        name = "CX Gaming Mouse";
        vendorId = "9639";
        productId = "64104";
        acceleration = 0.4;
        accelerationProfile = "none";
      };

      touchpads = lib.singleton {
        enable = true;
        name = "ELAN07C6:00 04F3:32C7 Touchpad";
        vendorId = "1267";
        productId = "12999";
        naturalScroll = true;
        tapToClick = true;
      };
    };
  };
}

