{ config, lib, pkgs, ... }:

let
  flags = config.flags.packages.cli;

  file-preview = pkgs.writeScript "file-preview" (builtins.readFile ./file-preview.sh);
  fzf-completions = pkgs.writeScript "fzf-completions" (builtins.readFile ./fzf-completions.sh);
  interactive-ripgrep = pkgs.writeScript "interactive-ripgrep" (builtins.readFile ./interactive-ripgrep.sh);
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
        "--preview='${file-preview} {}'"
      ];
    };
  
    programs.zsh.customAutoloadScripts = [
      fzf-completions
      interactive-ripgrep
    ];
  };
}
