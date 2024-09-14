{ config, lib, pkgs, ... }:

final: prev: {
  obsidian = prev.obsidian.override {
    commandLineArgs = "--disable-gpu";
  };
}
