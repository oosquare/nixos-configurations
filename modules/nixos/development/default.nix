{ config, lib, pkgs, ... }:

let
  flags = config.flags.packages.development;
in {
  config = lib.mkIf flags.enable {
    environment.systemPackages = with pkgs; [
      gnumake
      nix-output-monitor
      nvd
    ];
  };
}
