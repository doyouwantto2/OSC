{
  config,
  pkgs,
  ...
}:

{
  environment.systemPackages = with pkgs; [
    libreoffice
    evince
    kanri
    thunderbird
  ];
}
