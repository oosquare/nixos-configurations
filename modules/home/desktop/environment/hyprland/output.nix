{ config, lib, pkgs, ... }:

{
  monitor = ", preferred, auto, 2";
  general.allow_tearing = false;
  xwayland.force_zero_scaling = true;
}
