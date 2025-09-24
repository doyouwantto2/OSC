{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    vesktop
    spotify
    slack
    telegram-desktop
    teams-for-linux
    zoom-us
    koodo-reader
    blueman
    krita
    dbgate
    wpsoffice
    obs-studio
    rofi
  ];

}

