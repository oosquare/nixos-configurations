{ config, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;

    initExtra = ''
      export PS1="
      %{%F{226}%}%n%{%F{220}%}@%{%F{214}%}%m %{%F{45}%}%1~
      %{%f%}> "

      export RPROMPT="%F{red}%(?..%?)%f"
    '';
  };
}
