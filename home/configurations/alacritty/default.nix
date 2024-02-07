{ config, lib, pkgs, flags, ... }@args:

let
  colorscheme = if flags.ui.colorscheme == "Tokyo Night Storm" then "tokyo-night-storm"
    else if flags.ui.colorscheme == "One Dark" then "one-dark"
    else builtins.abort "Invalid value `${flags.ui.colorscheme}` for `flags.ui.colorscheme`";
in {
  programs.alacritty.enable = true;

  programs.alacritty.settings = {
    font.size = 10;
    selection.semantic_escape_chars = '',.?│`|:;"' ()[]{}<>	!@#$%^&*-=+/~'';
    keyboard.bindings = import ./keybindings.nix args;
    colors = import ./themes/${colorscheme}.nix args;

    window = {
      decorations = "None";
      opacity = 0.7;

      padding = {
        x = 4;
        y = 0;
      };
    };
  };
}
