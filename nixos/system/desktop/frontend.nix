{
  config,
  pkgs,
  ...
}:

{
  environment.systemPackages = with pkgs; [
    quickshell
    dms-shell
    starship
    papirus-icon-theme
  ];
}
