{ config, lib, pkgs, ... }:

let
  flags = config.flags.packages.cli;
  cfg = config.programs.fzf;

  fzf-completions = pkgs.writeScript "fzf-completions" (builtins.readFile ./fzf-completions.sh);
in {
  config = {
    home.packages = lib.mkIf cfg.enable [
      (pkgs.writeScriptBin "preview-file" (builtins.readFile ./preview-file.sh))
      (pkgs.writeScriptBin "rgi" (builtins.readFile ./interactive-ripgrep.sh))
    ];

    programs.fzf = {
      enable = flags.enable;
  
      defaultCommand = ''
        fd --follow --color=always -E ".git" -E "build" -E "target" -E "node_modules" .
      '';
  
      defaultOptions = [
        "--ansi"
        "--reverse"
        "--scroll-off=5"
        "--cycle"
        "--preview-window=border-left"
        "--preview='preview-file {}'"
      ];
    };
  
    programs.zsh.customAutoloadScripts = lib.mkIf cfg.enable [
      fzf-completions
    ];
  };
}
