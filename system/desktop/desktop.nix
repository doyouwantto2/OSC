{ config, pkgs, ... }:

{
  imports = [ 
    ./basic.nix
    ./apps.nix
  ]; 

  programs.hyprland.enable = true;

  environment.systemPackages = with pkgs; [
  ];
 
}
