{ config, lib, pkgs, ... }:

let
  flags = config.flags.packages.desktop;
in {
  config = lib.mkIf flags.enable {
    fonts = let
      cfg = config.flags.ui.font;
    in {
      packages = (with pkgs; [
      ]) ++ (lib.optionals cfg.notoFonts (with pkgs; [
        noto-fonts
        (lib.mkIf flags.i18n.enable noto-fonts-cjk-sans)
        (lib.mkIf flags.i18n.enable noto-fonts-cjk-serif)
      ])) ++ (lib.optionals cfg.sourceCodePro (with pkgs; [
        source-code-pro
      ])) ++ (lib.optionals cfg.emoji (with pkgs; [
        noto-fonts-color-emoji
        (nerdfonts.override { fonts = [ "NerdFontsSymbolsOnly" ]; })
      ]));
    };
  };
}
