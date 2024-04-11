{ config, lib, pkgs, inputs, ... }:

let
  flags = config.flags.packages.desktop.production;
in {
  config = lib.mkIf flags.enable {
    home.packages = with pkgs; [
      # logseq
      inputs.nixpkgs-d8fe5e6c.legacyPackages.${pkgs.system}.logseq
      newsflash
    ];
  };
}
