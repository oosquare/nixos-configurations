{
  description = "NixOS Flake";

  nixConfig = {
    substituters = [
      # Mirror sites of the official cache server
      "https://mirror.sjtu.edu.cn/nix-channels/store"
      "https://mirrors.ustc.edu.cn/nix-channels/store"
      "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store"

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
  };

  outputs = inputs@{ self, nixpkgs, ... }: {
    nixosConfigurations = {
      "oo-laptop" = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = inputs;

        modules = [
          ./system/oo-laptop

          {
            nix.settings.trusted-users = [ "oo-infty" ];
          }
        ];
      };
    };
  };
}
