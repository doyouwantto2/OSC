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

  # System packages for database management
  environment.systemPackages = with pkgs; [
    postgresql_15
    mariadb.client
    pgcli
    azuredatastudio
    dbgate
  ];

  # PostgreSQL container using systemd
  systemd.services."postgres-container" = {
    description = "PostgreSQL Docker Container";
    wantedBy = [ "multi-user.target" ];
    after = [ "docker.service" ];
    serviceConfig = {
      Type = "simple";
      ExecStart = "${pkgs.docker}/bin/docker run --name postgres_db --restart unless-stopped -p 5432:5432 -e POSTGRES_DB=osc_db -e POSTGRES_USER=osc_user -e POSTGRES_PASSWORD=postgres_password -e POSTGRES_INITDB_ARGS='--encoding=UTF-8 --lc-collate=C --lc-ctype=C' -v postgres_data:/var/lib/postgresql/data postgres:15";
      ExecStop = "${pkgs.docker}/bin/docker stop postgres_db";
      ExecStopPost = "${pkgs.docker}/bin/docker rm postgres_db";
      Restart = "always";
    };
    preStart = ''
      ${pkgs.docker}/bin/docker volume create postgres_data || true
    '';
  };

  # MySQL container using systemd
  systemd.services."mysql-container" = {
    description = "MySQL Docker Container";
    wantedBy = [ "multi-user.target" ];
    after = [ "docker.service" ];
    serviceConfig = {
      Type = "simple";
      ExecStart = "${pkgs.docker}/bin/docker run --name mysql_db --restart unless-stopped -p 3306:3306 -e MYSQL_DATABASE=osc_db -e MYSQL_USER=osc_user -e MYSQL_PASSWORD=mysql_password -e MYSQL_ROOT_PASSWORD=mysql_root_password -v mysql_data:/var/lib/mysql mysql:8.0";
      ExecStop = "${pkgs.docker}/bin/docker stop mysql_db";
      ExecStopPost = "${pkgs.docker}/bin/docker rm mysql_db";
      Restart = "always";
    };
    preStart = ''
      ${pkgs.docker}/bin/docker volume create mysql_data || true
    '';
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
}
