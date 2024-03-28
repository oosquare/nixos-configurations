{ config, lib, pkgs, constants, ... }@args:

{
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

   nix.settings.trusted-users = [ constants.username ];

   nix.gc = {
    automatic = true;
    dates = "daily";
    options = "--delete-older-than 7d";
  };

	nixpkgs.overlays = import ../../../overlays args;
  nixpkgs.config.allowUnfree = true;
}
