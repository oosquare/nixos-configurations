{ config, lib, pkgs, inputs, ... }:

let
  flags = config.flags.packages.desktop.production;
in {
  config = lib.mkIf flags.enable {
    home.packages = with pkgs; [
      logseq
      newsflash
      inputs.to-concentrate.packages.${pkgs.system}.to-concentrate
    ];
  };
}
