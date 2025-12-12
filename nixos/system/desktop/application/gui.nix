{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    brave

    vesktop
    slack

    libreoffice
    koodo-reader
    inkscape

    osu-lazer

    mars-mips
  ];
}
