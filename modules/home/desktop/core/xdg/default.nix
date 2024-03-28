{ config, lib, pkgs, ... }:

let
  flags = config.flags.packages.desktop;
in {
  config = lib.mkIf flags.enable {
    xdg = {
      configHome = /home/${config.home.username}/.config;
      cacheHome = /home/${config.home.username}/.cache;
      dataHome = /home/${config.home.username}/.local/share;
      stateHome = /home/${config.home.username}/.local/state;
  
      userDirs = {
        enable = true;
        createDirectories = true;
  
        desktop = "${config.home.homeDirectory}/desktop";
        documents = "${config.home.homeDirectory}/userdata/documents";
        download = "${config.home.homeDirectory}/download";
        music = "${config.home.homeDirectory}/userdata/music";
        pictures = "${config.home.homeDirectory}/userdata/pictures";
        publicShare = "${config.home.homeDirectory}/public";
        templates = "${config.home.homeDirectory}/templates";
        videos = "${config.home.homeDirectory}/userdata/videos";
      };
    };
  };
}
