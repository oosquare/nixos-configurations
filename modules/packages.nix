{ config, lib, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    # Basic tools
    wget
    curl
    helix
    htop
    git

    # Fonts
    source-han-sans
  ];

  programs.zsh.enable = true;
}
