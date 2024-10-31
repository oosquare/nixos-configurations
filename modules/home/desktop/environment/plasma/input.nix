{ config, lib, pkgs, ... }:

{
  programs.plasma.input = {
    keyboard = {
      layouts = lib.singleton {
        layout = "us";
      };

      repeatDelay = 250;
    };

    mice = lib.singleton {
      enable = true;
      name = "Compx 2.4G Receiver Mouse";
      vendorId = "13652";
      productId = "64512";
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
      rightClickMethod = "twoFingers";
      scrollMethod = "twoFingers";
    };
  };
}
