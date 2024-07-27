{ config, lib, pkgs, ... }:

let
  cfg = config.services.ssh;
in {
  options.services.ssh = {
    enable = lib.mkEnableOption "Whether to enable the SSH service";

    package = lib.mkPackageOption pkgs "openssh" {};

    dataPath = lib.mkOption {
      type = lib.types.str;
      default = "${config.user.home}/.sshd";
      description = ''
        Path to store sshd configurations.
      '';
    };

    tmpPath = lib.mkOption {
      type = lib.types.str;
      default = "${cfg.dataPath}-tmp";
      description = ''
        Path to store sshd configurations temporarily.
      '';
    };

    port = lib.mkOption {
      type = lib.types.port;
      default = 8022;
      description = ''
        Which port should sshd listen on.
      '';
    };

    authorizedKeys = lib.mkOption {
      type = lib.types.lines;
      default = "";
      description = ''
        Authorized keys seperated by lines.
      '';
    };
  };

  config = lib.mkIf cfg.enable {
    environment.packages = [
      cfg.package

      (pkgs.writeScriptBin "sshd-start" ''
        #!${pkgs.runtimeShell}
        echo "Starting sshd in non-daemonized way on port ${toString cfg.port}"
        ${cfg.package}/bin/sshd -f "${cfg.dataPath}/sshd_config" -D
      '')
    ];

      build.activation.sshd = ''
        $DRY_RUN_CMD mkdir $VERBOSE_ARG -p "${config.user.home}/.ssh"
        $DRY_RUN_CMD echo -e ${lib.escapeShellArg cfg.authorizedKeys} > "${config.user.home}/.ssh/authorized_keys"

        if [[ ! -d "${cfg.dataPath}" ]]; then
          $DRY_RUN_CMD rm $VERBOSE_ARG -rf "${cfg.tmpPath}"
          $DRY_RUN_CMD mkdir $VERBOSE_ARG -p "${cfg.tmpPath}"

          $VERBOSE_ECHO "Generating host keys..."
          $DRY_RUN_CMD ${cfg.package}/bin/ssh-keygen -t ed25519 -f "${cfg.tmpPath}/ssh_host_ed25519_key" -N ""

          $VERBOSE_ECHO "Writing sshd_config..."
          $DRY_RUN_CMD echo -e "HostKey ${cfg.dataPath}/ssh_host_ed25519_key\nPort ${toString cfg.port}\n" > "${cfg.tmpPath}/sshd_config"

          $DRY_RUN_CMD mv $VERBOSE_ARG "${cfg.tmpPath}" "${cfg.dataPath}"
        fi
      '';
  };
}
