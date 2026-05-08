{
  config,
  pkgs,
  ...
}:

{
  environment.systemPackages = with pkgs; [
    libreoffice
    evince
    shotcut
    thunderbird
    zotero
  ];
}
