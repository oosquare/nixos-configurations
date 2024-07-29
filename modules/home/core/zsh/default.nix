{ config, lib, pkgs, ... }:

let
  cfg = config.programs.zsh;
  flags = config.flags.packages.core;
in {
  options.programs.zsh = {
    customAutoloadScripts = lib.mkOption {
      description = "Custom scripts needed to be load automatically at startup";
      type = lib.types.listOf lib.types.package;
      default = [];
    };
  };

  config = lib.mkIf flags.enable {
    home.packages = [
      (pkgs.writeScriptBin "git-branch-format" (builtins.readFile ./git-branch-format.sh))
    ];

    programs.zsh = {
      enable = true;
      autosuggestion.enable = true;
      enableCompletion = true;
      syntaxHighlighting.enable = true;
  
      initExtra = let
        loadScript = builtins.concatStringsSep
          "\n"
          (builtins.map (script: "source ${script}") cfg.customAutoloadScripts);
      in ''
        # Load variables and functions
        ${loadScript}

        # Set prompt style
        setopt prompt_subst
        export PS1='%{%F{226}%}%n%{%F{220}%}@%{%F{214}%}%m%{%F{red}%}$(git-branch-format) %{%F{45}%}%~
        %{%f%}> '

        export RPROMPT="%F{red}%(?..%?)%f"
      '';
  
      shellAliases = {
        ga = "git add .";
        gs = "git status";
        gl = "git log --pretty='format:%C(yellow)%h %C(blue)%ad %C(white)%s' --graph --date=short";
        rm = "echo 'rm: command is disabled for security'";
        tsp = "trash-put";
      };
    };
  };
}
