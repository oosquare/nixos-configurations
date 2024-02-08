{ config, lib, pkgs, ... }:

{
  "$mainMod" = "SUPER";
  "$terminal" = "~/.scripts/executables/execute-alacritty.sh";

  bind = [
    "$mainMod, Q, exec, $terminal"
    "$mainMod, C, killactive"
    "$mainMod, M, exit, "
    "$mainMod, E, exec, nautilus"
    "$mainMod, V, togglefloating, "
    "$mainMod, F, fullscreen, 1"
    "$mainMod, R, exec, tofi-drun --terminal '$terminal -e' | xargs -I % sh -c '%'  "
    "$mainMod, P, togglesplit, # dwindle"
    "$mainMod, A, exec, ~/.scripts/executables/select-clipboard-entry.sh"
    "$mainMod, S, exec, ~/.scripts/executables/capture-screen.sh selection ~/userdata/pictures/screenshots"
    "$mainMod SHIFT, S, exec, ~/.scripts/executables/capture-screen.sh fullscreen ~/userdata/pictures/screenshots"
    "$mainMod CTRL, S, exec, ~/.scripts/executables/capture-screen.sh active ~/userdata/pictures/screenshots"
    "$mainMod, L, exec, ~/.scripts/executables/lock.sh"

    # Move focus
    "ALT, Tab, cyclenext"
    "ALT SHIFT, Tab, cyclenext, prev"
    "$mainMod, J, movefocus, l"
    "$mainMod, L, movefocus, r"
    "$mainMod, I, movefocus, u"
    "$mainMod, K, movefocus, d"

    # Switch workspaces
    "$mainMod, 1, workspace, 1"
    "$mainMod, 2, workspace, 2"
    "$mainMod, 3, workspace, 3"
    "$mainMod, 4, workspace, 4"
    "$mainMod, 5, workspace, 5"
    "$mainMod, 6, workspace, 6"
    "$mainMod, 7, workspace, 7"
    "$mainMod, 8, workspace, 8"
    "$mainMod, 9, workspace, 9"
    "$mainMod, 0, workspace, 10"
    "$mainMod CTRL, Left, workspace, -1"
    "$mainMod CTRL, Right, workspace, +1"

    # Move active window to a workspace
    "$mainMod SHIFT, 1, movetoworkspace, 1"
    "$mainMod SHIFT, 2, movetoworkspace, 2"
    "$mainMod SHIFT, 3, movetoworkspace, 3"
    "$mainMod SHIFT, 4, movetoworkspace, 4"
    "$mainMod SHIFT, 5, movetoworkspace, 5"
    "$mainMod SHIFT, 6, movetoworkspace, 6"
    "$mainMod SHIFT, 7, movetoworkspace, 7"
    "$mainMod SHIFT, 8, movetoworkspace, 8"
    "$mainMod SHIFT, 9, movetoworkspace, 9"
    "$mainMod SHIFT, 0, movetoworkspace, 10"
    "$mainMod SHIFT, Left, movetoworkspace, -1"
    "$mainMod SHIFT, Right, movetoworkspace, +1"

    # Scroll through existing workspaces with mainMod + scroll
    "$mainMod, mouse_down, workspace, +1"
    "$mainMod, mouse_up, workspace, -1"
  ];

  # Move/resize windows with mainMod + LMB/RMB and dragging
  bindm = [
    "$mainMod, mouse:272, movewindow"
    "$mainMod, mouse:273, resizewindow"
  ];
}
