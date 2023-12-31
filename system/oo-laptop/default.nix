{ config, lib, pkgs, ... }:

{
  imports = [
    ../../modules/i18n.nix
    ../../modules/desktop.nix
    ../../modules/packages.nix
    ../../modules/networking.nix
    ../../modules/services.nix
    ./hardware-configuration.nix
  ];

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

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

  networking.hostName = "oo-laptop"; # Define your hostname.

  time.timeZone = "Asia/Shanghai";

  users.users.oo-infty = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
    packages = with pkgs; [
      firefox
      ripgrep
      fd
      qq
      fzf
      neofetch
      bat
    ];
  };
 
  environment.variables = {
    EDITOR = "hx";
    VISUAL = "hx";
  };

  system.stateVersion = "24.05";
}

