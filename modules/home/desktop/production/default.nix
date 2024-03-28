{ config, lib, pkgs, ... }:

{
  home.packages = with pkgs; [
    logseq
    newsflash
  ];
}
