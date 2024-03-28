{ config, lib, pkgs, ... }:

let
  flags = config.flags.packages.cli;
in {
  imports = [
    ./atuin
    ./fzf
    ./git
    ./zellij
  ];

  config = lib.mkIf flags.enable {
    home.packages = with pkgs; [
      bat
      fd
      jq
      neofetch
      ripgrep
      tree
      unzip
    ];
  };
}
