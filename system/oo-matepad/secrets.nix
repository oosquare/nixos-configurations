{ config, lib, pkgs, constants, ... }:

{
  imports = [ ../../secrets ];

  age.identityPaths = [
    "${config.services.ssh.dataPath}/ssh_host_ed25519_key"
  ];

  age.rekey = {
    hostPubkey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOJXSDvBmovM+SmxEwS/NURE2aD9MepYWKgVSKqTJufP nix-on-droid@localhost";
    masterIdentities = [ ../../secrets/identities/master-identity.age ];
    storageMode = "local";
    localStorageDir = ../../secrets/rekeyed/${constants.hostname};
  };
}

