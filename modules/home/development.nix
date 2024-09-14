{ config, lib, pkgs, ... }:

let
  flags = config.flags.packages.development;
in {
  config = lib.mkIf flags.enable {
    home.packages = with pkgs; [
      vscode
      jetbrains.idea-community
    ];
  };
}
