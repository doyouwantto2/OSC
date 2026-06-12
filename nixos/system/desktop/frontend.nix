{
  config,
  pkgs,
  ...
}:

{
  environment.systemPackages = with pkgs; [
    quickshell
    noctalia-shell
    dms-shell
    starship
    papirus-icon-theme
  ];
}
