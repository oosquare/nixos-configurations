{ config, lib, pkgs, root, ... }:

{
  programs.firefox.profiles.default = {
    id = 0;
    isDefault = true;
    search = {
      default = "Google";
      force = true;
      engines = {
        "GitHub" = {
          urls = lib.singleton {
            template = "https://github.com/search";
            params = [
              { name = "q"; value = "{searchTerms}"; }
              { name = "type"; value = "repositories"; }
            ];
          };

          icon = root + /assets/icons/github.png;
          definedAliases = [ "@gh" ];
        };

        "NixOS Packages" = {
          urls = lib.singleton {
            template = "https://search.nixos.org/packages";
            params = [
              { name = "type"; value = "packages"; }
              { name = "query"; value = "{searchTerms}"; }
            ];
          };

          icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
          definedAliases = [ "@np" ];
        };
        
        "NixOS Options" = {
          urls = lib.singleton {
            template = "https://search.nixos.org/options";
            params = [
              { name = "type"; value = "packages"; }
              { name = "query"; value = "{searchTerms}"; }
            ];
          };

          icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
          definedAliases = [ "@no" ];
        };

        "Home Manager Options" = {
          urls = lib.singleton {
            template = "https://home-manager-options.extranix.com";
            params = [
              { name = "query"; value = "{searchTerms}"; }
              { name = "release"; value = "master"; }
            ];
          };

          icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
          definedAliases = [ "@nh" ];
        };

        "NixOS Wiki" = {
          urls = lib.singleton {
            template = "https://wiki.nixos.org/w/index.php";
            params = [
              { name = "search"; value = "{searchTerms}"; }
            ];
          };

          icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
          definedAliases = [ "@nw" ];
        };

        "Bing".metaData.hidden = true;
      };
    };
  };
}
