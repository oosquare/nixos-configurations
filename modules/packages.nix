{ config, lib, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    # Basic tools
    wget
    curl
    helix
    htop

    # Development
    git
    gnumake
    nix-output-monitor
    nvd
  ];

  programs.zsh.enable = true;
}
