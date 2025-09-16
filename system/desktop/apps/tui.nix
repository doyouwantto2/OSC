{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    cava
    unzip
    gnutar
    git
    netlify-cli
    fastfetch
    htop
    spotify-cli-linux
    networkmanager
    networkmanagerapplet
    networkmanager-sstp
    restman
  ];

}


