{ config, lib, pkgs, ... }:

let
  flags = config.flags.packages.core;
in {
  imports = [
    ./nix.nix
  ];

  config = lib.mkIf flags.enable {
    environment.systemPackages = with pkgs; [
      curl
      helix
    ];
  
    programs.zsh.enable = true;
  };
}
