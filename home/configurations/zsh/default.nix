{ config, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;

    initExtra = ''
      # Load essential functions and variables
      for file in ~/.scripts/utilities/**/*.sh; do
          if [[ -f $file ]]; then
              source $file
          fi
      done

      # Set prompt style
      setopt prompt_subst
      export PS1='%{%F{226}%}%n%{%F{220}%}@%{%F{214}%}%m%{%F{red}%}$(get_branch) %{%F{45}%}%~
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

  home.file.".scripts/utilities/zsh/get-branch.sh".source = ./get-branch.sh;
}
