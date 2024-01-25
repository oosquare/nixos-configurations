{ config, pkgs, flags, ... }:

let
  colorscheme = if flags.ui.colorscheme == "Tokyo Night Storm" then "tokyo-night-storm"
    else if flags.ui.colorscheme == "One Dark" then "one-dark"
    else builtins.abort "Invalid value `${flags.ui.colorscheme}` for `flags.ui.colorscheme`";
in {
  home.file.".config/alacritty/alacritty.toml".source = pkgs.substitute {
    src = ./alacritty.toml;
    replacements = [ "--replace @%colorscheme-placeholder%@ ${colorscheme}" ];
  };

  home.file.".config/alacritty/themes" = {
    source = ./themes;
    recursive = true;
  };
}
