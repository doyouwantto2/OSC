{
  config,
  pkgs,
  lib,
  ...
}:

{
  environment.systemPackages = with pkgs; [
    dbeaver-bin
    docker-compose
    mongodb-compass
    surrealist
  ];
}
