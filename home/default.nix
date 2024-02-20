{ config, pkgs, constants, ... }:

{
  imports = [
    ./scripts
    ./configurations
    ../global/flags.nix
  ];

  home.username = constants.username;
  home.homeDirectory = "/home/${config.home.username}";

  home.packages = with pkgs; [
    firefox
    ripgrep
    fd
    qq
    neofetch
    bat
    alacritty
    tree
    unzip
    logseq
    keepassxc
    vscode
    telegram-desktop
    mpv
    playerctl
    jq
    libnotify
  ];

  home.stateVersion = "24.05";

  programs.home-manager.enable = true;
}
