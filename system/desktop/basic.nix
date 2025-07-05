{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    wl-clipboard
    unzip
    gnutar
    git
  ]; 
}

