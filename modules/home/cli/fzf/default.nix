{ config, lib, pkgs, ... }:

let
  flags = config.flags.packages.cli;
in {
  config = lib.mkIf flags.enable {
    programs.fzf = {
      enable = true;
  
      defaultCommand = ''
        fd --follow --color=always -E ".git" -E "build" -E "target" -E "node_modules" .
      '';
  
      defaultOptions = [
        "--ansi"
        "--reverse"
        "--scroll-off=5"
        "--cycle"
        "--preview-window=border-left"
        "--preview='zsh ~/.scripts/executables/preview.sh {}'"
      ];
    };
  
    home.file.".scripts/utilities/fzf/completions.sh".source = ./completions.sh;
  };
}
