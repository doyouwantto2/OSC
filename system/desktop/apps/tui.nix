{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    cava
    unzip
    gnutar
    git
    fastfetch
    spotify-cli-linux
    networkmanager
    networkmanagerapplet
    networkmanager-sstp
  ];

}


