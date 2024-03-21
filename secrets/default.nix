{ config, lib, pkgs, ... }:

{
  age.secrets = {
    "example-secrets.age".rekeyFile = ./example-secrets.age;
  };
}
