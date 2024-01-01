{ config, pkgs, ... }:

{
  home.username = "oo-infty";
  home.homeDirectory = "/home/oo-infty";

  home.packages = with pkgs; [
   firefox
   ripgrep
   fd
   qq
   fzf
   neofetch
   bat
   foot
  ];

  programs.git = {
    userName = "oo-infty";
    userEmail = "oo-infty@outlook.com";
  };

  home.stateVersion = "24.05";

  programs.home-manager.enable = true;
}
