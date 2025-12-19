{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    brave
    librewolf

    vesktop
    slack
    telegram-desktop

    libreoffice
    koodo-reader
    inkscape

    osu-lazer

    mars-mips
  ];
}
