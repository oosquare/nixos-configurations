{ config, lib, pkgs, ... }:

{
  imports = [
    ./atuin
    ./fzf
    ./git
    ./zellij
  ];

  home.packages = with pkgs; [
    bat
    fd
    jq
    neofetch
    ripgrep
    tree
    unzip
  ];
}
