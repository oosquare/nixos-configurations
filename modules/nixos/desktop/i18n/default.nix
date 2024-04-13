{ config, lib, pkgs, ... }:

let
  flags = config.flags.packages.desktop.i18n;
in {
  config = lib.mkIf flags.enable {
    i18n.defaultLocale = "zh_CN.UTF-8";
  
    i18n.inputMethod = {
      enabled = "fcitx5";
      fcitx5.addons = [ pkgs.fcitx5-chinese-addons ];
    };
    
    fonts = {
      packages = with pkgs; [
        noto-fonts
        noto-fonts-cjk-sans
        noto-fonts-cjk-serif
      ];
    };
  };
}
