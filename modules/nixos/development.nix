{ config, lib, pkgs, constants, ... }:

let
  flags = config.flags.packages.development;
in {
  config = lib.mkIf flags.enable {
    environment.systemPackages = with pkgs; [
      gnumake
      nix-output-monitor
      nvd
    ];

    programs.wireshark = {
      enable = true;
      package = pkgs.wireshark;
    };

    users.users.${constants.username}.extraGroups = [ "wireshark" ];
  };
}
