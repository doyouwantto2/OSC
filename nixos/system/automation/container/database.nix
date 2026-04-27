{
  config,
  pkgs,
  lib,
  user,
  ...
}:

{
  # Tools
  environment.systemPackages = with pkgs; [
    postgresql_15
    pgcli
    dbeaver-bin
  ];

  # Không chạy PostgreSQL tự động
  services.postgresql.enable = false;
}
