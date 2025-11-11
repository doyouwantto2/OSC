{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    rofi
    discord
    slack
    waypaper
    osu-lazer
    libreoffice
    veloren
    vlc
    koodo-reader
    mars-mips


  ];
}
