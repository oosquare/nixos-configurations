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
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    hyprland = {
      url = "github:hyprwm/Hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nixpkgs, home-manager, ... }: let
    buildSystem = { system, hostname }: let
      constants = (import ./global/constants.nix) // { inherit hostname; };
    in
      nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = { inherit inputs constants; };

        modules = [
          ./system/${hostname}
          ./global/flags-def.nix
          { nix.settings.trusted-users = [ constants.username ]; }

          home-manager.nixosModules.home-manager {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.${constants.username} = import ./home;
            home-manager.extraSpecialArgs = { inherit inputs constants; };
          }
        ];
      };

    buildShell = { system, packages ? (pkgs: []), hook ? "" }: let
      pkgs = import nixpkgs { inherit system; };
    in
      pkgs.mkShell {
        packages = packages pkgs;

        shellHook = ''
          exec zsh
          ${hook}
        '';
      };
  in {
    nixosConfigurations = {
      "oo-laptop" = buildSystem {
        system = "x86_64-linux";
        hostname = "oo-laptop";
      };
    };

    devShells = {
      x86_64-linux.default = buildShell {
        system = "x86_64-linux";
        packages = (pkgs: with pkgs; [ nil ]);
      };
    };
  };
}
