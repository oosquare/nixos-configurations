{ config, lib, pkgs, ... }:

let
  browser = "firefox";
  terminal = "~/.scripts/executables/execute-alacritty.sh";
  launcher = "tofi-drun --terminal '${terminal} -e' | xargs -I % sh -c '%'";
  screenshot = "~/.scripts/executables/capture-screen.sh";
  screenshotDir = "~/userdata/pictures/screenshots";
  clipboard = "~/.scripts/executables/select-clipboard-entry.sh";
  locker = "~/.scripts/executables/lock.sh";

  keybindings = [
    { key = "W"; modifiers = [ "SUPER" ]; dispatcher = "exec"; args = browser; }
    { key = "W"; modifiers = [ "SUPER SHIFT" ]; dispatcher = "exec"; args = "${browser} --private-window"; }
    { key = "Q"; modifiers = [ "SUPER" ]; dispatcher = "exec"; args = terminal; }
    { key = "C"; modifiers = [ "SUPER" ]; dispatcher = "killactive"; }
    { key = "M"; modifiers = [ "SUPER" ]; dispatcher = "exit"; }
    { key = "E"; modifiers = [ "SUPER" ]; dispatcher = "exec"; args = "nautilus"; }
    { key = "V"; modifiers = [ "SUPER" ]; dispatcher = "togglefloating"; }
    { key = "F"; modifiers = [ "SUPER" ]; dispatcher = "fullscreen"; args = "1"; }
    { key = "R"; modifiers = [ "SUPER" ]; dispatcher = "exec"; args = launcher; }
    { key = "P"; modifiers = [ "SUPER" ]; dispatcher = "togglesplit"; }
    { key = "A"; modifiers = [ "SUPER" ]; dispatcher = "exec"; args = clipboard; }
    { key = "S"; modifiers = [ "SUPER" ]; dispatcher = "exec"; args = "${screenshot} selection ${screenshotDir}"; }
    { key = "S"; modifiers = [ "SUPER SHIFT" ]; dispatcher = "exec"; args = "${screenshot} fullscreen ${screenshotDir}"; }
    { key = "S"; modifiers = [ "SUPER CTRL" ]; dispatcher = "exec"; args = "${screenshot} active ${screenshotDir}"; }
    { key = "L"; modifiers = [ "SUPER SHIFT" ]; dispatcher = "exec"; args = locker; }

    # Move focus
    { key = "Tab"; modifiers = [ "ALT" ]; dispatcher = "cyclenext"; }
    { key = "Tab"; modifiers = [ "ALT SHIFT" ]; dispatcher = "cyclenext"; args = "prev"; }
    { key = "J"; modifiers = [ "SUPER" ]; dispatcher = "movefocus"; args = "l"; }
    { key = "L"; modifiers = [ "SUPER" ]; dispatcher = "movefocus"; args = "r"; }
    { key = "I"; modifiers = [ "SUPER" ]; dispatcher = "movefocus"; args = "u"; }
    { key = "K"; modifiers = [ "SUPER" ]; dispatcher = "movefocus"; args = "d"; }

    # Switch workspaces
    { key = "1"; modifiers = [ "SUPER" ]; dispatcher = "workspace"; args = "1"; }
    { key = "2"; modifiers = [ "SUPER" ]; dispatcher = "workspace"; args = "2"; }
    { key = "3"; modifiers = [ "SUPER" ]; dispatcher = "workspace"; args = "3"; }
    { key = "4"; modifiers = [ "SUPER" ]; dispatcher = "workspace"; args = "4"; }
    { key = "5"; modifiers = [ "SUPER" ]; dispatcher = "workspace"; args = "5"; }
    { key = "6"; modifiers = [ "SUPER" ]; dispatcher = "workspace"; args = "6"; }
    { key = "7"; modifiers = [ "SUPER" ]; dispatcher = "workspace"; args = "7"; }
    { key = "8"; modifiers = [ "SUPER" ]; dispatcher = "workspace"; args = "8"; }
    { key = "9"; modifiers = [ "SUPER" ]; dispatcher = "workspace"; args = "9"; }
    { key = "0"; modifiers = [ "SUPER" ]; dispatcher = "workspace"; args = "10"; }
    { key = "Left"; modifiers = [ "SUPER CTRL" ]; dispatcher = "workspace"; args = "-1"; }
    { key = "Right"; modifiers = [ "SUPER CTRL" ]; dispatcher = "workspace"; args = "+1"; }

    # Move active window to a workspace
    { key = "1"; modifiers = [ "SUPER SHIFT" ]; dispatcher = "movetoworkspace"; args = "1"; }
    { key = "2"; modifiers = [ "SUPER SHIFT" ]; dispatcher = "movetoworkspace"; args = "2"; }
    { key = "3"; modifiers = [ "SUPER SHIFT" ]; dispatcher = "movetoworkspace"; args = "3"; }
    { key = "4"; modifiers = [ "SUPER SHIFT" ]; dispatcher = "movetoworkspace"; args = "4"; }
    { key = "5"; modifiers = [ "SUPER SHIFT" ]; dispatcher = "movetoworkspace"; args = "5"; }
    { key = "6"; modifiers = [ "SUPER SHIFT" ]; dispatcher = "movetoworkspace"; args = "6"; }
    { key = "7"; modifiers = [ "SUPER SHIFT" ]; dispatcher = "movetoworkspace"; args = "7"; }
    { key = "8"; modifiers = [ "SUPER SHIFT" ]; dispatcher = "movetoworkspace"; args = "8"; }
    { key = "9"; modifiers = [ "SUPER SHIFT" ]; dispatcher = "movetoworkspace"; args = "9"; }
    { key = "0"; modifiers = [ "SUPER SHIFT" ]; dispatcher = "movetoworkspace"; args = "10"; }
    { key = "Left"; modifiers = [ "SUPER SHIFT" ]; dispatcher = "movetoworkspace"; args = "-1"; }
    { key = "Right"; modifiers = [ "SUPER SHIFT" ]; dispatcher = "movetoworkspace"; args = "+1"; }

    # Scroll through existing workspaces with mainMod + scroll
    { key = "mouse_down"; modifiers = [ "SUPER" ]; dispatcher = "workspace"; args = "+1"; }
    { key = "mouse_up"; modifiers = [ "SUPER" ]; dispatcher = "workspace"; args = "-1"; }

    { mode = "m"; key = "mouse:272"; modifiers = [ "SUPER" ]; dispatcher = "movewindow"; }
    { mode = "m"; key = "mouse:273"; modifiers = [ "SUPER" ]; dispatcher = "resizewindow"; }
  ];

  buildKeybinding = { key, modifiers ? [], dispatcher, args ? "", ... }: let
    modifierString = builtins.concatStringsSep " " modifiers;
  in
    builtins.concatStringsSep "," ([ modifierString key dispatcher ] ++ (lib.optional (args != "") args));
in 
  lib.attrsets.concatMapAttrs
    (mode: keybindings: { "bind${mode}" = (builtins.map buildKeybinding keybindings); })
    (builtins.groupBy ({ mode ? "", ... }: mode) keybindings)
