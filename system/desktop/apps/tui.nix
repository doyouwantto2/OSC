{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    cava
    unzip
    gnutar
    git
    fastfetch
    spotify-cli-linux
    batmon
    networkmanager
    networkmanagerapplet
    networkmanager-sstp
  ];

}


