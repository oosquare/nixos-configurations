{ config, pkgs, ... }:

{
  home.file.".config/fontconfig/fonts.conf".source = ./fonts.conf;
}
