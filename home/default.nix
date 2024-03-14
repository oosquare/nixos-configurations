{ config, pkgs, inputs, constants, ... }:

{
  imports = [
    ./scripts
    ./configurations
    ../global/flags.nix
  ];

  home.username = constants.username;
  home.homeDirectory = "/home/${config.home.username}";

  home.packages = with pkgs; [
    alacritty
    bat
    fd
    firefox-devedition-bin
    jq
    keepassxc
    libnotify
    logseq
    neofetch
    playerctl
    qq
    ripgrep
    telegram-desktop
    thunderbird
    tree
    unzip
    vscode
  ] ++ (with inputs.nur.packages.${pkgs.system}; [
    fcitx5-fluent-dark
  ]);

  home.stateVersion = "24.05";

  programs.home-manager.enable = true;
}
