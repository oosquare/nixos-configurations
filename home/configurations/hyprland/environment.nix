{ config, lib, pkgs, ... }:

let
  environment = {
    # XDG specifications
    XDG_SESSION_TYPE = "wayland";
    XDG_CURRENT_DESKTOP = "Hyprland";
    XDG_SESSION_DESKTOP = "Hyprland";

    # Toolkit backends
    GDK_BACKEND = "wayland,x11";
    QT_QPA_PLATFORM = "wayland;xcb";
    SDL_VIDEODRIVER = "wayland";
    CLUTTER_BACKEND = "wayland";

    # Themes
    XCURSOR_SIZE = 32;
    GTK_THEME = "Adwaita:dark";
    QT_QPA_PLATFORMTHEME = "qt5ct";

    # UI
    QT_AUTO_SCREEN_SCALE_FACTOR = 1;
    QT_WAYLAND_DISABLE_WINDOWDECORATION = 1;
    
    # Viedo card preference
    WLR_DRM_DEVICES = "/dev/dri/card1:/dev/dri/card0";

    # XWayland
    GDK_SCALE = 2;
  };
in {
  env = builtins.map
    ({ name, value }: "${name}, ${builtins.toString value}")
    (lib.attrsets.attrsToList environment);
}

