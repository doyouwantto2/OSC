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

    qemu
    gns3-gui
    gns3-server
    vpcs
    dynamips

    mars-mips
  ];
}
