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

  config = {
    home.packages = lib.mkIf cfg.enable [
      (pkgs.writeScriptBin "git-branch-format" (builtins.readFile ./git-branch-format.sh))
    ];

    programs.zsh = {
      enable = flags.enable;
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
        ga = "git add . && git status";
        gs = "git status";
        gl = "git log --pretty='format:%C(yellow)%h %C(blue)%ad %C(white)%s' --graph --date=short";
        gd = "git diff HEAD";
        gp = "git push";
        gpr = "git pull --rebase";
        rm = "echo 'rm: command is disabled for security'";
        tsp = "trash-put";
        x = ''__XPLR_CD_OUTPUT=$(xplr); cd "$__XPLR_CD_OUTPUT" > /dev/null 2>&1 || echo $__XPLR_CD_OUTPUT; unset __XPLR_CD_OUTPUT'';
      };
    };
  };
}
