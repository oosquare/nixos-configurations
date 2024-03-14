{ config, lib, pkgs, ... }:

{
  programs.mpv.enable = true;

  programs.mpv.defaultProfiles = [ "high-quality" ];

  programs.mpv.config = {
    vo = "gpu";
    hwdec = "auto";
    blend-subtitles = "video";
    video-sync = "display-resample";
    interpolation = "yes";
    tscale = "oversample";
    cache = "yes";
    cache-on-disk = "no";
    save-position-on-quit = "yes";
  };

  programs.mpv.bindings = {
    MBTN_LEFT_DBL = "cycle fullscreen";
    WHEEL_UP = "add volume 5";
    WHEEL_DOWN = "add volume -5";
    UP = "add volume 5";
    DOWN = "add volume -5";
  };

  programs.mpv.scripts = with pkgs.mpvScripts; [
    uosc
    mpris
  ];
}
