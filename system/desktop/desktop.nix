{ config, pkgs, ... }:

{
  imports = [ ./basic.nix ]; 

  programs.hyprland.enable = true;
}
