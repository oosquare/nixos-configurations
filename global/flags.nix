# Global flags which control various features across different
# applications and systems, aiming to easily switch configurations
# within a place.
{
  # UI-related flags, including CLI and GUI
  ui = {
    # Colorscheme for editors, terminals and so on
    # Expected value:
    # - Tokyo Night Storm
    # - One Dark
    colorscheme = "One Dark";

    theme = {
      # The name of a window theme series which controls the window appearance
      # Expected value:
      # - Adwaita
      # - Orchis
      window = "Orchis";

      # The name of a icon theme series
      # Expected value:
      # - Adwaita
      # - Reversal
      icon = "Reversal";

      # The name of a cursor theme series
      # Expected value:
      # - Vimix
      cursor = "Vimix";

      # The option which determines whether to enable the dark mode
      # - Expected value:
      # - Light
      # - Dark
      mode = "Dark";
    };
  };

  # Desktop environments, window managers or Wayland compositors
  desktop = {
    gnome = {
      enable = true;
    };

    hyprland = {
      enable = true;
      dev = true;
    };
  };
}
