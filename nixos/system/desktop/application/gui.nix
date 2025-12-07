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
    umbrello

    osu-lazer

    mars-mips
  ];
}
