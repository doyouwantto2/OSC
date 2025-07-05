{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    wl-clipboard
    git
  ]; 
}

