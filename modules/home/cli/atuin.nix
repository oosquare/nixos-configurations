{ config, lib, pkgs, ... }:

let
  flags = config.flags.packages.cli;
in {
  programs.atuin.enable = flags.enable;

  programs.atuin.settings = {
    update_check = false;
    style = "compact";
    show_help = false;
    enter_accept = true;
    workspaces = true;

    common_subcommands = [
      "nix"
      "cargo"
      "git"
    ];

    common_prefix = [
      "sudo"
    ];

    history_filter = [
      ''^\\.*''
      ''^git reset.*''
      ''^rm.*''
      ''^ .*''
    ];
  };
}
