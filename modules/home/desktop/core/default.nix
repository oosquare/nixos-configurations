{ config, lib, pkgs, inputs, ... }:

{
  imports = [
    ./alacritty
    ./fontconfig
    ./gtk
    ./qt
    ./xdg
  ];
  
  home.packages = with pkgs; [
    keepassxc
    libnotify
  ] ++ (with inputs.nur.packages.${pkgs.system}; [
    fcitx5-fluent-dark
  ]);
}
