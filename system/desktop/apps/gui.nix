{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    vesktop
    spotify
    slack
    teams-for-linux
    zoom-us
    alexandria
    neohtop
    blueman
    krita
    gaphor
    obs-studio
    rofi-wayland
  ];

}

