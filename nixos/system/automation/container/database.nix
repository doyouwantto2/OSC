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
    pgcli
    dbeaver-bin
  ];

systemd.services."postgres-container" = {
  description = "PostgreSQL Docker Container";
  wantedBy = [ "multi-user.target" ];
  after = [ "docker.service" ];

  preStart = ''
    ${pkgs.docker}/bin/docker volume create postgres_data || true

    if ! ${pkgs.docker}/bin/docker ps -a --format '{{.Names}}' | grep -q '^postgres_db$'; then
      ${pkgs.docker}/bin/docker create \
        --name postgres_db \
        -p 5432:5432 \
        -e POSTGRES_DB=osc_db \
        -e POSTGRES_USER=osc_user \
        -e POSTGRES_PASSWORD=postgres_password \
        -v postgres_data:/var/lib/postgresql/data \
        postgres:15
    fi
  '';

  serviceConfig = {
    ExecStart = "${pkgs.docker}/bin/docker start -a postgres_db";
    ExecStop = "${pkgs.docker}/bin/docker stop postgres_db";
    Restart = "always";
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
    ensureDatabases = [ "osc_db" ];
    ensureUsers = [
      {
        name = "osc_user";
        ensurePermissions."DATABASE osc_db" = "ALL PRIVILEGES";
      }
    ];
  };
}
