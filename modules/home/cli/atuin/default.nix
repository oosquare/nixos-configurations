{ config, pkgs, ... }:

{
  programs.atuin.enable = true;

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
  };
}
