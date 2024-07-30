{ config, lib, pkgs, ... }:

let
  flags = config.flags.packages.desktop.network;
in {
  imports = [
    ./extensions.nix
    ./profiles.nix
    ./security.nix
  ];

  config = lib.mkIf flags.enable {
    programs.firefox.enable = true;

    programs.firefox.languagePacks = [ "zh-CN" "en-US" ];
    programs.firefox.nativeMessagingHosts = with pkgs; [
      kdePackages.plasma-browser-integration
    ];
  };
}
