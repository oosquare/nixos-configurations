{ config, lib, pkgs, ... }:

{
  imports = [
    ./gnome.nix
    ./hyprland.nix
  ];
}
