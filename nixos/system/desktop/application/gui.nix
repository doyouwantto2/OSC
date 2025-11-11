{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    rofi
    discord
    waypaper
    slack
    osu-lazer
    libreoffice
    veloren
    aircrack-ng
    vlc
    mars-mips
  ];
}
