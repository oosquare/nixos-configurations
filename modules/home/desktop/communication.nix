{ config, lib, pkgs, ... }:

let
  flags = config.flags.packages.desktop.communication;
in {
  config = lib.mkIf flags.enable {
    home.packages = with pkgs; [
      qq
      telegram-desktop
      thunderbird
      config.nur.repos.linyinfeng.wemeet
    ];
  };
}
