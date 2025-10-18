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
    dbgate
    wpsoffice
    obs-studio
    rofi
    logisim
    mars-mips
    inkscape

    kando
    gnomeExtensions.kando-integration
  ];

}

