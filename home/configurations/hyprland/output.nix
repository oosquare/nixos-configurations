{ config, lib, pkgs, ... }:

{
  monitor = ", preferred, auto, 1.6";
  general.allow_tearing = false;
  xwayland.force_zero_scaling = true;
}
