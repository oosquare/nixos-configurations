{ config, pkgs, flags, ... }@args:

let
  colorscheme = if flags.ui.colorscheme == "Tokyo Night Storm" then "tokyo-night-storm-transparent"
    else if flags.ui.colorscheme == "One Dark" then "one-dark-transparent"
    else builtins.abort "Invalid value `${flags.ui.colorscheme}` for `flags.ui.colorscheme`";
in {
  programs.helix.enable = true;

  programs.helix.settings = {
    theme = colorscheme;
    editor = import ./editor.nix args;
    keys = import ./keybindings.nix args;
  };

  programs.helix.themes = {
    one-dark-transparent = import ./themes/one-dark-transparent.nix args;
    tokyo-night-storm-transparent = import ./themes/tokyo-night-storm-transparent.nix args;
  };
}
