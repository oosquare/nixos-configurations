{ config, pkgs, ... }:

{
  imports = [
    ./scripts
    ./configurations
  ];

  home.username = "oo-infty";
  home.homeDirectory = "/home/${config.home.username}";

  home.packages = with pkgs; [
    firefox
    ripgrep
    fd
    qq
    neofetch
    bat
    foot
    tree
    unzip
    logseq
  ];

  programs.git = {
    userName = "oo-infty";
    userEmail = "oo-infty@outlook.com";
  };

  home.stateVersion = "24.05";

  programs.home-manager.enable = true;
}
