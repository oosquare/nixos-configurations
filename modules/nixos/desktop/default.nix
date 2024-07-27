{ config, lib, pkgs, ... }:

let
  flags = config.flags.packages.desktop;
in {
  imports = [
    ./environment

    ./i18n.nix
    ./network.nix
  ];

  config = lib.mkIf flags.enable {
    services.libinput.enable = true;
    services.printing.enable = true;

    fonts = let
      cfg = config.flags.ui.font;
    in {
      packages = (with pkgs; [
      ]) ++ lib.optionals cfg.notoFonts (with pkgs; [
        noto-fonts
        (lib.mkIf flags.i18n.enable noto-fonts-cjk-sans)
        (lib.mkIf flags.i18n.enable noto-fonts-cjk-serif)
      ]) ++ lib.optionals cfg.code.sourceCodePro (with pkgs; [
        source-code-pro
      ]) ++ lib.optionals cfg.emoji (with pkgs; [
        noto-fonts-color-emoji
        (nerdfonts.override { fonts = [ "NerdFontsSymbolsOnly" ]; })
      ]);
    };
  };
}
