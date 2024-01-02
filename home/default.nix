{ config, pkgs, ... }:

{
  imports = [
    ./scripts
 
    ./zsh
    ./fzf
  ];

  home.username = "oo-infty";
  home.homeDirectory = "/home/oo-infty";

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
  ];

  programs.git = {
    userName = "oo-infty";
    userEmail = "oo-infty@outlook.com";
  };

  home.stateVersion = "24.05";

  programs.home-manager.enable = true;
}
