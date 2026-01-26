{
  config,
  pkgs,
  ...
}:

{
  environment.systemPackages = with pkgs; [
    astro-language-server
  ];
}
