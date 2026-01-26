{
  config,
  pkgs,
  ...
}:

{
  environment.systemPackages = with pkgs; [
    quickshell
    noctalia-shell

    starship

    papirus-icon-theme
  ];
}
