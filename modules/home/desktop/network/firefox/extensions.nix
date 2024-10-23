{ config, lib, pkgs, ... }:

{
  programs.firefox.policies.ExtensionSettings = let
    extension = name: uuid: {
      name = uuid;
      value = {
        install_url = "https://addons.mozilla.org/en-US/firefox/downloads/latest/${name}/latest.xpi";
        installation_mode = "normal_installed";
      };
    };

    extensionWithUrl = uuid: url: {
      name = uuid;
      value = {
        install_url = url;
        installation_mode = "normal_installed";
      };
    };
  in
    lib.listToAttrs [
      (extension "canvasblocker" "CanvasBlocker@kkapsner.de")
      (extension "clearurls" "{74145f27-f039-47ce-a470-a662b129930a}")
      (extension "darkreader" "addon@darkreader.org")
      (extension "keepassxc-browser" "keepassxc-browser@keepassxc.org")
      (extension "multi-account-containers" "@testpilot-containers")
      (extension "privacy-badger17" "jid1-MnnxcxisBPnSXQ@jetpack")
      (extension "scroll_anywhere" "juraj.masiar@gmail.com_ScrollAnywhere")
      (extension "skip-redirect" "skipredirect@sblask")
      (extension "smart-https-revived" "{b3e677f4-1150-4387-8629-da738260a48e}")
      (extension "ublock-origin" "uBlock0@raymondhill.net")
      (extensionWithUrl "magnolia@12.34" "https://github.com/bpc-clone/bpc_updates/releases/download/latest/bypass_paywalls_clean-latest.xpi")
    ];
}
