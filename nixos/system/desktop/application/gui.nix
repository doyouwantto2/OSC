{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    brave

    rofi
    blueman
    waypaper

    vesktop
    slack

    libreoffice
    koodo-reader
    inkscape
    visual-paradigm-ce

    osu-lazer

    mars-mips
  ];
}
