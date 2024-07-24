{ config, lib, pkgs, ... }:

let
  flags = config.flags.packages.desktop.environment.plasma;
in {
  config = lib.mkIf flags.enable {
    programs.plasma.configFile = {
      kcminputrc.Keyboard.RepeatDelay = 250;

      kcminputrc."Libinput/9639/64104/CX Gaming Mouse".PointerAcceleration = 0.400;
      kcminputrc."Libinput/9639/64104/CX Gaming Mouse".PointerAccelerationProfile = 1;
    };
  };
}

