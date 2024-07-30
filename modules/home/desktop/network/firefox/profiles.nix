{ config, lib, pkgs, ... }:

let
  flags = config.flags.packages.desktop.network;
in {
  config = lib.mkIf flags.enable {
    programs.firefox.profiles.default = {
      id = 0;
      isDefault = true;
      search = {
        default = "Bing";
        force = true;
        engines = {
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
        };
      };
    };
  };
}
