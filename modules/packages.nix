{ config, lib, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    # Basic tools
    wget
    curl
    helix
    htop

    # Fonts
    source-han-sans

    # Development
    git
    gnumake
  ];

  programs.zsh.enable = true;
}
