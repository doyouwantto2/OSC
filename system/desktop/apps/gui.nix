{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    discord
    spotify
    slack
    teams-for-linux
    zoom-us
    foliate
    neohtop
    pgadmin4-desktopmode

    rofi-wayland
  ];

}

