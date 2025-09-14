{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    cava
    unzip
    gnutar
    git
    vercel-pkg
    fastfetch
    spotify-cli-linux
    networkmanager
    networkmanagerapplet
    networkmanager-sstp
    restman
  ];

}


