{ config, lib, pkgs, ... }:

let
  flags = config.flags.packages.desktop.environment;

  song-info = pkgs.writeScript
    "song-info"
    (builtins.readFile ./song-info.sh);
  
  alacritty-wrapper = pkgs.writeScript
    "alacritty-wrapper"
    (builtins.readFile ../scripts/alacritty-wrapper.sh);
in {
  config = lib.mkIf flags.enable {
    home.file.".config/waybar/config".source = pkgs.substitute {
      src = ./config;
      replacements = [
        "--replace-fail" "@@%%song-info%%@@" "${song-info}"
        "--replace-fail" "@@%%alacritty-wrapper%%@@" "${alacritty-wrapper}"
      ];
    };
    home.file.".config/waybar/style.css".source = ./style.css;
  };
}
