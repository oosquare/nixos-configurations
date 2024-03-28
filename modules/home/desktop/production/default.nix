{ config, lib, pkgs, ... }:

let
  flags = config.flags.packages.desktop.production;
in {
  config = lib.mkIf flags.enable {
    home.packages = with pkgs; [
      logseq
      newsflash
    ];
  };
}
