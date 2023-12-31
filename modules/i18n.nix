{ config, lib, pkgs, ... }:

{
  # Locale
  i18n.defaultLocale = "zh_CN.UTF-8";

  # Input method
  i18n.inputMethod = {
    enabled = "fcitx5";
    fcitx5.addons = [ pkgs.fcitx5-chinese-addons ];
  };
}
