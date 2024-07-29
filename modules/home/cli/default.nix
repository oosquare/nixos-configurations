{ config, lib, pkgs, ... }:

let
  flags = config.flags.packages.cli;
in {
  imports = [
    ./fzf
    ./scripts
    ./zellij

    ./atuin.nix
    ./git.nix
    ./gh.nix
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
