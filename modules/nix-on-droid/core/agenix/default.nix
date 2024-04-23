{ config, lib, pkgs, ... }:

let
  scriptType = let
    scriptOptions = {
      deps = lib.mkOption {
        type = lib.types.listOf lib.types.str;
        default = [];
        description = "List of dependencies. The script will run after these.";
      };

      text = lib.mkOption {
        type = lib.types.lines;
        description = "The content of the script.";
      };

      supportsDryActivation = lib.mkOption {
        type = lib.types.bool;
        default = false;
        description = ''
          Whether this activation script supports being dry-activated.
          These activation scripts will also be executed on dry-activate
          activations with the environment variable
          `NIXOS_ACTION` being set to `dry-activate`.
          it's important that these activation scripts  don't
          modify anything about the system when the variable is set.
        '';
      };
    };
  in
    lib.types.either lib.types.str (lib.types.submodule { options = scriptOptions; });
in {
  options.system.activationScripts = lib.mkOption {
    type = lib.types.attrsOf (scriptType);
    default = {};
  };

  config = {
    build.activation.agenix = let
      newGeneration = config.system.activationScripts.agenixNewGeneration.text;
      install = config.system.activationScripts.agenixInstall.text;
      chown = config.system.activationScripts.agenixChown.text;
    in
      builtins.concatStringsSep "\n" [ newGeneration install chown ];
  };
}
