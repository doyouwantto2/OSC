{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    cava
    unzip
    gnutar
    git
    fastfetch
    htop
    spotify-cli-linux
    networkmanager
    networkmanagerapplet
    networkmanager-sstp
    restman
  ];

}


