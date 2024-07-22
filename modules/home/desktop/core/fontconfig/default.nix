{ config, lib, pkgs, ... }:

let
  flags = config.flags.packages.desktop;
in {
  config = lib.mkIf flags.enable {
    home.file.".config/fontconfig/fonts.conf".source = pkgs.substitute {
      src = ./fonts.conf;
      substitutions = let
        mainCodeFont = config.flags.ui.font.code.main;
      in [
        "--replace-fail" "@@%%main-code-font%%@@" "${mainCodeFont}"
      ];
    };
  };
}
