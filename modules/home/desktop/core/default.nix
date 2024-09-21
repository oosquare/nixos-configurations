{ config, lib, pkgs, ... }:

let
  flags = config.flags.packages.desktop;
in {
  imports = [
    ./alacritty
    ./fontconfig
    ./gtk
    ./qt
    ./scripts
    ./waybar

    ./mako.nix
    ./tofi.nix
    ./xdg.nix
  ];
  
  config = lib.mkIf flags.enable {
    home.packages = with pkgs; [
      keepassxc
      libnotify
      fcitx5-fluent
    ];
  };
}
