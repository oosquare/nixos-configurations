{ config, lib, pkgs, ... }:

let
  flags = config.flags.packages.desktop.environment;
in {
  config = lib.mkIf flags.enable {
    home.packages = let
      makeScript = name: pkgs.writeScriptBin name (builtins.readFile ./${name}.sh);
    in [
      (makeScript "waybar-song-info")
    ];

    home.file.".config/waybar/config".source = ./config;
    home.file.".config/waybar/style.css".source = ./style.css;
  };
}
