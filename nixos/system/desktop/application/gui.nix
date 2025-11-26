{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    brave

    rofi
    waypaper

    vesktop
    slack

    libreoffice
    koodo-reader
    inkscape

    osu-lazer

    vlc
    mars-mips
  ];
}
