{ config, lib, pkgs, constants, ... }:

{
  imports = [
    # Common modules
    ../../modules/i18n.nix
    ../../modules/desktop
    ../../modules/fonts.nix
    ../../modules/packages.nix
    ../../modules/networking.nix
    ../../modules/services.nix

    # System-specific modules
    ./hardware.nix
    ./containers.nix
  ];

  # Nix settings
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  nix.gc = {
    automatic = true;
    dates = "daily";
    options = "--delete-older-than 7d";
  };

  networking.hostName = "oo-laptop";

  time.timeZone = "Asia/Shanghai";

  users.users.${constants.username} = {
    isNormalUser = true;
    shell = pkgs.zsh;
    extraGroups = [ "wheel" "networkmanager" ];
  };
 
  environment.variables = {
    EDITOR = "hx";
    VISUAL = "hx";
  };

  system.stateVersion = "24.05";
}

