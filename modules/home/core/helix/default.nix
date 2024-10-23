{ config, lib, pkgs, ... }@args:

let
  flags = config.flags.packages.core;

  colorscheme = if config.flags.ui.colorscheme == "Tokyo Night Storm" then
    "tokyo-night-storm-transparent"
  else if config.flags.ui.colorscheme == "One Dark" then
    "one-dark-transparent"
  else
    builtins.abort "Unreachable";
in {
  programs.helix.enable = flags.enable;

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
