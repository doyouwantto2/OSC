{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    vesktop
    spotify
    slack
    teams-for-linux
    zoom-us
    foliate
    neohtop
    blueman

    rofi-wayland
  ];

}

