{
  config,
  pkgs,
  ...
}:

{
  environment.systemPackages = with pkgs; [
    libreoffice
    shotcut
    thunderbird
    zotero
  ];
}
