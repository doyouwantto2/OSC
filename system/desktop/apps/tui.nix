{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    cava
    unzip
    gnutar
    git
    fastfetch
    neohtop
    spotify-cli-linux
    networkmanager
    networkmanagerapplet
    networkmanager-sstp
  ];

}


