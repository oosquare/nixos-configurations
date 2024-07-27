{ config, lib, pkgs, ... }:

let
  flags = config.flags.packages.desktop.environment;
in {
  config = lib.mkIf flags.enable {
    programs.tofi.enable = true;
    programs.tofi.settings = {
      width = "55%";
      height = "45%";
      border-width = 2;
      outline-width = 0;
      result-spacing = 5;
      corner-radius = 15;
      font = "monospace";
      font-size = 14;
      background-color = "#000A";
      history = true;
    };

    # Fix for missing desktop entries in tofi-drun
    home.activation = {
      # https://github.com/philj56/tofi/issues/115#issuecomment-1701748297
      removeTofiCache = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
        tofi_cache=${config.xdg.cacheHome}/tofi-drun
        rm $tofi_cache || true
      '';
    };
  };
}
