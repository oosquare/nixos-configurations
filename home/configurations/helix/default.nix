{ config, pkgs, flags, ... }:

let
  colorscheme = if flags.ui.colorscheme == "Tokyo Night Storm" then "tokyonight_storm_transparent"
    else if flags.ui.colorscheme == "One Dark" then "one_dark_transparent"
    else builtins.abort "Invalid value `${flags.ui.colorscheme}` for `flags.ui.colorscheme`";
in {
  home.file.".config/helix/config.toml".source = pkgs.substitute {
    src = ./config.toml;
    replacements = [ "--replace @%colorscheme-placeholder%@ ${colorscheme}" ];
  };

  home.file.".config/helix/themes" = {
    source = ./themes;
    recursive = true;
  };
}
