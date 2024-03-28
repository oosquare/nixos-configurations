{ config, lib, pkgs, ... }:

{
  home.packages = with pkgs; [
    qq
    telegram-desktop
    thunderbird
  ];
}
