{ config, lib, pkgs, ... }:

let
  flags = config.flags.packages.desktop;
in {
  config = lib.mkIf flags.enable {
    home.packages = let
      makeScript = name: pkgs.writeScriptBin name (builtins.readFile ./${name}.sh);
    in [
      (makeScript "capture-screen")
      (makeScript "swayidle-wrapper")
      (makeScript "swaylock-wrapper")
      (makeScript "alacritty-wrapper")
      (makeScript "clipboard-selector")
    ];
  };
}
