{ config, lib, pkgs, ... }:

{
  home.file.".config/tofi/config".source = ./config;

  # Fix for missing desktop entries in tofi-drun
  home.activation = {
    # https://github.com/philj56/tofi/issues/115#issuecomment-1701748297
    removeTofiCache = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
      tofi_cache=${config.xdg.cacheHome}/tofi-drun
      rm $tofi_cache || true
    '';
  };
}
