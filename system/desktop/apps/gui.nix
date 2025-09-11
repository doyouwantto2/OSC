{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    vesktop
    spotify
    slack
    teams-for-linux
    zoom-us
    koodo-reader
    blueman
    krita
    dbgate
    wpsoffice
    obs-studio
    rofi-wayland
  ];

}

