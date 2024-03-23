{ config, lib, pkgs, ... }:

final: prev: {
  newsflash = final.stdenvNoCC.mkDerivation {
    inherit (prev.newsflash) pname version meta;
    buildInputs = [ prev.newsflash ];
    dontUnpack = true;

    postInstall = ''
      mkdir -p $out/bin $out/share/applications
      ln -s ${prev.newsflash}/bin/io.gitlab.news_flash.NewsFlash $out/bin/newsflash
      cp -r ${prev.newsflash}/share/applications/io.gitlab.news_flash.NewsFlash.desktop $out/share/applications/newsflash.desktop
      substituteInPlace $out/share/applications/newsflash.desktop \
          --replace-fail "Exec=io.gitlab.news_flash.NewsFlash" "Exec=newsflash" \
    '';
  };
}

