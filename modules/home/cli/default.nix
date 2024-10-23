{ config, lib, pkgs, ... }:

let
  flags = config.flags.packages.cli;
in {
  imports = [
    ./atuin.nix
    ./fzf
    ./gh.nix
    ./git.nix
    ./scripts
    ./xplr
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
