{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    cava
    unzip
    gnutar
    git
    fastfetch
    cointop
    spotify-cli-linux
    networkmanager
    networkmanagerapplet
    networkmanager-sstp
  ];

}


