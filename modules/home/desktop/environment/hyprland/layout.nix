{ config, lib, pkgs, ... }:

{
  general = {
    layout = "dwindle";
  };

  dwindle = {
    pseudotile = true;
    preserve_split = true;
  };

  master = {
    new_status = "master";
  };
}
