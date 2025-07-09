{ config, pkgs, ... }:

{
  programs.hyprland.enable = true;
  programs.hyprlock.enable = true;

  environment.systemPackages = with pkgs; [
    waybar
    waypaper

    hyprcursor
    hyprpaper
    hyprsysteminfo

    rose-pine-hyprcursor
  ]; 
}

