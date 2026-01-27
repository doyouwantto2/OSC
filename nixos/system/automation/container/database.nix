{
  config,
  pkgs,
  lib,
  user,
  ...
}:

{
  # Enable Docker for container management
  virtualisation.docker.enable = true;

  # PostgreSQL container configuration with SOPS secrets
  virtualisation.oci-containers.containers."postgres" = {
    image = "postgres:15";
    ports = [ "5432:5432" ];
    environment = {
      POSTGRES_DB = config.sops.secrets.postgres_db.value or "osc_db";
      POSTGRES_USER = config.sops.secrets.postgres_user.value or "osc_user";
      POSTGRES_PASSWORD = config.sops.secrets.postgres_password.value or "postgres_password";
      POSTGRES_INITDB_ARGS = config.sops.secrets.postgres_initdb_args.value or "--encoding=UTF-8 --lc-collate=C --lc-ctype=C";
    };
    volumes = [
      "postgres_data:/var/lib/postgresql/data"
    ];
    extraOptions = [
      "--restart=unless-stopped"
      "--network=bridge"
      "--name=postgres_db"
    ];
  };

  # MySQL container configuration with SOPS secrets
  virtualisation.oci-containers.containers."mysql" = {
    image = "mysql:8.0";
    ports = [ "3306:3306" ];
    environment = {
      MYSQL_DATABASE = config.sops.secrets.mysql_db.value or "osc_db";
      MYSQL_USER = config.sops.secrets.mysql_user.value or "osc_user";
      MYSQL_PASSWORD = config.sops.secrets.mysql_password.value or "mysql_password";
      MYSQL_ROOT_PASSWORD = config.sops.secrets.mysql_root_password.value or "mysql_root_password";
    };
    volumes = [
      "mysql_data:/var/lib/mysql"
    ];
    extraOptions = [
      "--restart=unless-stopped"
      "--network=bridge"
      "--name=mysql_db"
    ];
  };

  # System packages for database management
  environment.systemPackages = with pkgs; [
    postgresql_15
    mariadb.client
    pgcli
  ];

  # SOPS secret definitions
  sops.secrets = {
    postgres_db = {
      sopsFile = ../../presets/database/postgresql.yaml;
      restartUnits = [ "docker-postgres.service" ];
    };
    postgres_user = {
      sopsFile = ../../presets/database/postgresql.yaml;
      restartUnits = [ "docker-postgres.service" ];
    };
    postgres_password = {
      sopsFile = ../../presets/database/postgresql.yaml;
      restartUnits = [ "docker-postgres.service" ];
    };
    postgres_initdb_args = {
      sopsFile = ../../presets/database/postgresql.yaml;
      restartUnits = [ "docker-postgres.service" ];
    };
    mysql_db = {
      sopsFile = ../../presets/database/mysql.yaml;
      restartUnits = [ "docker-mysql.service" ];
    };
    mysql_user = {
      sopsFile = ../../presets/database/mysql.yaml;
      restartUnits = [ "docker-mysql.service" ];
    };
    mysql_password = {
      sopsFile = ../../presets/database/mysql.yaml;
      restartUnits = [ "docker-mysql.service" ];
    };
    mysql_root_password = {
      sopsFile = ../../presets/database/mysql.yaml;
      restartUnits = [ "docker-mysql.service" ];
    };
  };

  # Optional: Enable PostgreSQL service locally (for development)
  services.postgresql = {
    enable = lib.mkDefault false;
    package = pkgs.postgresql_15;
    enableTCPIP = lib.mkDefault false;
    authentication = lib.mkDefault ''
      # TYPE  DATABASE        USER            ADDRESS                 METHOD
      local   all             all                                     trust
      host    all             all             127.0.0.1/32            trust
    '';
    ensureDatabases = [ config.sops.secrets.postgres_db.value or "osc_db" ];
    ensureUsers = [
      {
        name = config.sops.secrets.postgres_user.value or "osc_user";
        ensurePermissions."DATABASE ${config.sops.secrets.postgres_db.value or "osc_db"}" = "ALL PRIVILEGES";
      }
    ];
  };

  # Optional: Enable MySQL service locally (for development)
  services.mysql = {
    enable = lib.mkDefault false;
    package = pkgs.mysql;
    ensureDatabases = [ config.sops.secrets.mysql_db.value or "osc_db" ];
    ensureUsers = [
      {
        name = config.sops.secrets.mysql_user.value or "osc_user";
        ensurePermissions = "osc_db.*:ALL";
      }
    ];
  };

  # Docker volume management
  systemd.services.docker-database-setup = {
    description = "Setup Docker volumes for databases";
    wantedBy = [ "multi-user.target" ];
    serviceConfig = {
      Type = "oneshot";
      ExecStart = "${pkgs.docker}/bin/docker volume create postgres_data";
      ExecStartPost = "${pkgs.docker}/bin/docker volume create mysql_data";
    };
  };
}