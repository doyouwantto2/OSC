{
  config,
  pkgs,
  ...
}:

{
  environment.systemPackages = with pkgs; [
    docker-language-server
    yaml-language-server
  ];
}
