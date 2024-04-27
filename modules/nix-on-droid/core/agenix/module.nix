{ config, lib, pkgs, ... }:

# Part of this file is from https://github.com/ryantm/agenix/blob/main/modules/age-home.nix by ryantm
let
  cfg = config.age;

  ageBin = lib.getExe config.age.package;

  newGeneration = ''
    _agenix_generation="$(basename "$(readlink "${cfg.secretsDir}")" || echo 0)"
    (( ++_agenix_generation ))
    $VERBOSE_ECHO "[agenix] creating new generation in ${cfg.secretsMountPoint}/$_agenix_generation"
    $DRY_RUN_CMD mkdir -p "${cfg.secretsMountPoint}"
    $DRY_RUN_CMD chmod 0751 "${cfg.secretsMountPoint}"
    $DRY_RUN_CMD mkdir -p "${cfg.secretsMountPoint}/$_agenix_generation"
    $DRY_RUN_CMD chmod 0751 "${cfg.secretsMountPoint}/$_agenix_generation"
  '';

  setTruePath = secretType:
    if secretType.symlink then ''
      _truePath="${cfg.secretsMountPoint}/$_agenix_generation/${secretType.name}"
    '' else ''
      _truePath="${secretType.path}"
    '';

  installSecret = secretType: ''
    ${setTruePath secretType}
    $VERBOSE_ECHO "decrypting '${secretType.file}' to '$_truePath'..."
    TMP_FILE="$_truePath.tmp"

    IDENTITIES=()
    # shellcheck disable=2043
    for identity in ${builtins.toString cfg.identityPaths}; do
      $DRY_RUN_CMD test -r "$identity" || continue
      IDENTITIES+=(-i)
      IDENTITIES+=("$identity")
    done

    $DRY_RUN_CMD test "''${#IDENTITIES[@]}" -eq 0 && $VERBOSE_ECHO "[agenix] WARNING: no readable identities found!"

    $DRY_RUN_CMD mkdir -p "$(dirname "$_truePath")"
    # shellcheck disable=SC2193,SC2050
    [ "${secretType.path}" != "${cfg.secretsDir}/${secretType.name}" ] && $DRY_RUN_CMD mkdir -p "$(dirname "${secretType.path}")"
    (
      $DRY_RUN_CMD umask u=r,g=,o=
      $DRY_RUN_CMD test -f "${secretType.file}" || echo '[agenix] WARNING: encrypted file ${secretType.file} does not exist!'
      $DRY_RUN_CMD test -d "$(dirname "$TMP_FILE")" || echo "[agenix] WARNING: $(dirname "$TMP_FILE") does not exist!"
      LANG=${config.i18n.defaultLocale or "C"} $DRY_RUN_CMD ${ageBin} --decrypt "''${IDENTITIES[@]}" -o "$TMP_FILE" "${secretType.file}"
    )
    $DRY_RUN_CMD chmod ${secretType.mode} "$TMP_FILE"
    $DRY_RUN_CMD mv -f "$TMP_FILE" "$_truePath"

    ${lib.optionalString secretType.symlink ''
      # shellcheck disable=SC2193,SC2050
      [ "${secretType.path}" != "${cfg.secretsDir}/${secretType.name}" ] && $DRY_RUN_CMD ln -sfn "${cfg.secretsDir}/${secretType.name}" "${secretType.path}"
    ''}
  '';

  testIdentities = builtins.map
    (path: ''
      test -f ${path} || echo '[agenix] WARNING: config.age.identityPaths entry ${path} not present!'
    '')
    cfg.identityPaths;

  cleanupAndLink = ''
    _agenix_generation="$(basename "$(readlink "${cfg.secretsDir}")" || echo 0)"
    (( ++_agenix_generation ))
    $VERBOSE_ECHO "[agenix] symlinking new secrets to ${cfg.secretsDir} (generation $_agenix_generation)..."
    $DRY_RUN_CMD ln -sfn "${cfg.secretsMountPoint}/$_agenix_generation" "${cfg.secretsDir}"

    (( _agenix_generation > 1 )) && {
    $VERBOSE_ECHO "[agenix] removing old secrets (generation $(( _agenix_generation - 1 )))..."
    $DRY_RUN_CMD rm -rf "${cfg.secretsMountPoint}/$(( _agenix_generation - 1 ))"
    }
  '';

  installSecrets = builtins.concatStringsSep "\n" (
    ["echo '[agenix] decrypting secrets...'"]
    ++ testIdentities
    ++ (builtins.map installSecret (builtins.attrValues cfg.secrets))
    ++ [cleanupAndLink]
  );

  secretType = lib.types.submodule ({ config, name, ... }: {
    options = {
      name = lib.mkOption {
        type = lib.types.str;
        default = name;
        description = ''
          Name of the file used in ''${cfg.secretsDir}
        '';
      };
      file = lib.mkOption {
        type = lib.types.path;
        description = ''
          Age file the secret is loaded from.
        '';
      };
      path = lib.mkOption {
        type = lib.types.str;
        default = "${cfg.secretsDir}/${config.name}";
        description = ''
          Path where the decrypted secret is installed.
        '';
      };
      mode = lib.mkOption {
        type = lib.types.str;
        default = "0400";
        description = ''
          Permissions mode of the decrypted secret in a format understood by chmod.
        '';
      };
      symlink = lib.mkEnableOption "symlinking secrets to their destination" // {default = true;};
    };
  });
in {
  options.age = {
    enable = lib.mkEnableOption ''
      Whether to enable agenix
    '';

    package = lib.mkPackageOption pkgs "age" {};

    secrets = lib.mkOption {
      type = lib.types.attrsOf secretType;
      default = {};
      description = ''
        Attrset of secrets.
      '';
    };

    identityPaths = lib.mkOption {
      type = lib.types.listOf lib.types.path;
      default = [
        "${config.home.homeDirectory}/.ssh/id_ed25519"
        "${config.home.homeDirectory}/.ssh/id_rsa"
      ];
      description = ''
        Path to SSH keys to be used as identities in age decryption.
      '';
    };

    secretsDir = lib.mkOption {
      type = lib.types.str;
      default = "${config.user.home}/.agenix/secrets";
      description = ''
        Folder where secrets are symlinked to
      '';
    };

    secretsMountPoint = lib.mkOption {
      default = "${config.user.home}/.agenix/mount";
      description = ''
        Where secrets are created before they are symlinked to ''${cfg.secretsDir}
      '';
    };
  };

  config = lib.mkIf (cfg.enable && cfg.secrets != {}) {
    assertions = [
      {
        assertion = cfg.identityPaths != [];
        message = "age.identityPaths must be set.";
      }
    ];

    build.activation.agenix = ''
      ${newGeneration}
      ${installSecrets}
    '';
  };
}
