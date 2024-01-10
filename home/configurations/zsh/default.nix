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
      export PS1="%{%F{226}%}%n%{%F{220}%}@%{%F{214}%}%m %{%F{45}%}%~
      %{%f%}> "

      export RPROMPT="%F{red}%(?..%?)%f"
    '';
  };
}
