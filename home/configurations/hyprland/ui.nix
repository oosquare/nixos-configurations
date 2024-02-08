{ config, lib, pkgs, ... }:

{
  general = {
    gaps_in = 5;
    gaps_out = 10;
    border_size = 2;
    "col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
    "col.inactive_border" = "rgba(595959aa)";
  };
  
  decoration = {
    rounding = 15;
    drop_shadow = false;
    shadow_range = 4;
    shadow_render_power = 3;
    "col.shadow" = "rgba(1a1a1aee)";

    blur = {
      enabled = false;
      size = 3;
      passes = 1;
    };
  };
  
  animations = {
    enabled = true;
    bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";
  
    animation = [
      "windows, 1, 7, myBezier"
      "windowsOut, 1, 7, default, popin 80%"
      "border, 1, 10, default"
      "borderangle, 1, 8, default"
      "fade, 1, 7, default"
      "workspaces, 1, 6, default"
    ];
  };
}
