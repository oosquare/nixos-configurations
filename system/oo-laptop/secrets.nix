{ config, lib, pkgs, constants, root, ... }:

{
  age.rekey = {
    hostPubkey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGXSkWOJfTAOScc9ELER7v/WmL38Ro8uNAC5NGrIbAYI";
    masterIdentities = [ ../../secrets/identities/master-identity.age ];
    storageMode = "local";
    localStorageDir = root + /secrets/rekeyed/${constants.hostname};
  };

  age.secrets = {
    "crates-io-auth.age".rekeyFile = root + /secrets/crates-io-auth-oo-laptop.age;
    "github-cli-auth.age".rekeyFile = root + /secrets/github-cli-auth-oo-laptop.age;
    "tailscale-auth.age".rekeyFile = root + /secrets/tailscale-auth-oo-laptop.age;
  };
}
