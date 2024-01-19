{ config, lib, pkgs, ... }:

{
  imports = [
    # Common modules
    ../../modules/i18n.nix
    ../../modules/desktop.nix
    ../../modules/fonts.nix
    ../../modules/packages.nix
    ../../modules/networking.nix
    ../../modules/services.nix

    # System-specific modules
    ./hardware-configuration.nix
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

  # GRUB 2
  boot.loader = {
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/efi";
    };

    grub = {
      device = "nodev";
      efiSupport = true;
      useOSProber = true;
    };
  };

  networking.hostName = "oo-laptop";

  time.timeZone = "Asia/Shanghai";

  users.users.oo-infty = {
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

