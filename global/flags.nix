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
