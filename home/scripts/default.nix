{ config, pkgs, ... }:

{
  home.file.".scripts/executables" = {
    source = ./executables;
    recursive = true;
  };

  home.file.".scripts/utilities" = {
    source = ./utilities;
    recursive = true;
  };
}
