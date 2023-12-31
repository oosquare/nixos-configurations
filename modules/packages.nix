{ config, lib, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    wget
    curl
    helix
    htop
    git

    # Fonts
    source-han-sans
  ];
}
