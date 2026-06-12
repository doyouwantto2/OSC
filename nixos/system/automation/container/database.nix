{
  config,
  pkgs,
  lib,
  ...
}:

{
  # Packages
  environment.systemPackages = with pkgs; [
    postgresql_15
    pgcli
    dbeaver-bin
    docker-compose
  ];

  # Disable native PostgreSQL service
  services.postgresql.enable = false;
  # PostgreSQL container
  virtualisation.oci-containers.containers.postgres = {
    image = "postgres:15";

    ports = [
      "5432:5432"
    ];

    environment = {
      POSTGRES_DB = "osc_db";
      POSTGRES_USER = "osc_user";
      POSTGRES_PASSWORD = "postgres_password";
    };

    volumes = [
      "postgres_data:/var/lib/postgresql/data"
    ];

    extraOptions = [
      "--restart=unless-stopped"
    ];
  };
}
