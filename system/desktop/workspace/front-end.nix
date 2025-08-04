{ config, pkgs, ... }:

{
  programs.hyprland.enable = true;
  programs.hyprlock.enable = true;

  environment.systemPackages = with pkgs; [
    waypaper
    waybar
    eww

    hyprcursor
    hyprpaper
  ]; 
}

