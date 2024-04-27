{
  description = "NixOS Flake";

  nixConfig = {
    substituters = [
      # Mirror sites of the official cache server
      # "https://mirrors.ustc.edu.cn/nix-channels/store"
      # "https://mirror.sjtu.edu.cn/nix-channels/store"
      # "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store"

      # NixOS's official cache server
      "https://cache.nixos.org"

      # Nix community's cache server
      "https://nix-community.cachix.org"
    ];

    trusted-public-keys = [
      "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    ];
  };

  inputs = {
    flake-parts.url = "github:hercules-ci/flake-parts";

    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    nur = {
      url = "github:oo-infty/nur-packages/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-on-droid = {
      url = "github:nix-community/nix-on-droid";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };

    agenix = {
      url = "github:ryantm/agenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    agenix-rekey = {
      url = "github:oddlama/agenix-rekey";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    hyprland = {
      url = "github:hyprwm/Hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, flake-parts, ... }@inputs:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [ "x86_64-linux" "aarch64-linux" ];

      perSystem = { self', inputs', config, pkgs, ... }: {
        devShells.default = let
          mkShell = pkgs.mkShell.override { stdenv = pkgs.stdenvNoCC; };
        in
          mkShell {
            packages = with pkgs; [
              nil
              inputs'.agenix-rekey.packages.default
            ];
          };
      };
    
      flake = {
        nixosConfigurations.oo-laptop = let
          hostname = "oo-laptop";
          constants = (import ./modules/constants.nix) // { inherit hostname; };
        in
          inputs.nixpkgs.lib.nixosSystem {
            system = "x86_64-linux";
            specialArgs = { inherit inputs constants; };
    
            modules = [
              ./system/${hostname}
    
              inputs.home-manager.nixosModules.home-manager {
                home-manager.useGlobalPkgs = true;
                home-manager.useUserPackages = true;
                home-manager.users.${constants.username} = import ./home/${hostname};
                home-manager.extraSpecialArgs = { inherit inputs constants; };
              }
    
              inputs.agenix.nixosModules.default
              inputs.agenix-rekey.nixosModules.default
            ];
          };

        nixOnDroidConfigurations.oo-matepad = let
          hostname = "oo-matepad";
          constants = (import ./modules/constants.nix) // { inherit hostname; };
        in
          inputs.nix-on-droid.lib.nixOnDroidConfiguration {
            extraSpecialArgs = { inherit inputs constants; };
            home-manager-path = inputs.home-manager.outPath;
    
            modules = [
              ./system/${hostname}
    
              {
                home-manager.config = ./home/${hostname};
                home-manager.backupFileExtension = "hm-bak";
                home-manager.useGlobalPkgs = true;
                home-manager.useUserPackages = true;
                home-manager.extraSpecialArgs = { inherit inputs constants; };
              }

              # inputs.agenix.nixosModules.default
              inputs.agenix-rekey.nixosModules.default
            ];
          };

        agenix-rekey = inputs.agenix-rekey.configure {
          userFlake = self;
          nodes = self.nixosConfigurations // self.nixOnDroidConfigurations;
        };
      };
    };
}
