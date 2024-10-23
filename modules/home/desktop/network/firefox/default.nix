{ config, lib, pkgs, ... }:

let
  flags = config.flags.packages.desktop.network;
in {
  imports = [
    ./extensions.nix
    ./profiles.nix
    ./security.nix
  ];

  programs.firefox.enable = flags.enable;

  programs.firefox.languagePacks = [ "zh-CN" "en-US" ];
  programs.firefox.nativeMessagingHosts = with pkgs; [
    kdePackages.plasma-browser-integration
  ];
}
