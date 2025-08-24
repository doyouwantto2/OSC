{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    webcord
    spotify
    slack
    teams-for-linux
    zoom-us
    neohtop
    koodo-reader
    blueman
    krita
    gaphor
    obs-studio
    rofi-wayland
  ];

}

