{ config, lib, pkgs, ... }@args:

{
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  nix.gc = {
    automatic = true;
    dates = "daily";
    options = "--delete-older-than 7d";
  };

	nixpkgs.overlays = import ../overlays args;
}
