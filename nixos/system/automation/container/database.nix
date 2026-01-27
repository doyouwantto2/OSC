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

  # PostgreSQL container configuration with basic secrets
  virtualisation.oci-containers.containers."postgres" = {
    image = "postgres:15";
    ports = [ "5432:5432" ];
    environment = {
      POSTGRES_DB = "osc_db";
      POSTGRES_USER = "osc_user";
      POSTGRES_PASSWORD = "postgres_password";
      POSTGRES_INITDB_ARGS = "--encoding=UTF-8 --lc-collate=C --lc-ctype=C";
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

  # MySQL container configuration with basic secrets
  virtualisation.oci-containers.containers."mysql" = {
    image = "mysql:8.0";
    ports = [ "3306:3306" ];
    environment = {
      MYSQL_DATABASE = "osc_db";
      MYSQL_USER = "osc_user";
      MYSQL_PASSWORD = "mysql_password";
      MYSQL_ROOT_PASSWORD = "mysql_root_password";
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
    ensureDatabases = [ "osc_db" ];
    ensureUsers = [
      {
        name = "osc_user";
        ensurePermissions."DATABASE osc_db" = "ALL PRIVILEGES";
      }
    ];
  };

  # Optional: Enable MySQL service locally (for development)
  services.mysql = {
    enable = lib.mkDefault false;
    package = pkgs.mysql;
    ensureDatabases = [ "osc_db" ];
    ensureUsers = [
      {
        name = "osc_user";
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