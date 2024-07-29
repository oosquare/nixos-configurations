{ config, lib, pkgs, ... }:

let
  flags = config.flags.packages.cli;
in {
  config = lib.mkIf flags.enable {
    home.packages = let
      makeScript = name: pkgs.writeScriptBin name (builtins.readFile ./${name}.sh);
    in [
      (makeScript "nx-depend")
      (makeScript "nx-readlink")
    ];
  };
}
