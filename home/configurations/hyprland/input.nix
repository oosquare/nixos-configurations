{ config, lib, pkgs, ... }:

{
  input = {
    kb_layout = "us";
    repeat_delay = 200;

    follow_mouse = 1;
    accel_profile = "flat";
    sensitivity = 0.4;

    touchpad = {
      natural_scroll = true;
      scroll_factor = 0.3;
    };
  };
  
  gestures = {
    workspace_swipe = true;
    workspace_swipe_fingers = 4;
    workspace_swipe_cancel_ratio = 0.3;
  };
}
