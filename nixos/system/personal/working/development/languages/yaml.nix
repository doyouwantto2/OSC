{
  config,
  pkgs,
  ...
}:

{
  environment.systemPackages = with pkgs; [
    docker
    docker-language-server
    yaml-language-server
  ];
}
