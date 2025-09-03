{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    cava
    unzip
    gnutar
    git
    fastfetch
    zenith
    spotify-cli-linux
    networkmanager
    networkmanagerapplet
    networkmanager-sstp
  ];

}


