{
  config,
  pkgs,
  ...
}:

{
  environment.systemPackages = with pkgs; [
    libreoffice
    openshot-qt
    thunderbird
  ];
}
