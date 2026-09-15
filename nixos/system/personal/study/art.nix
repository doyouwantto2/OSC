{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    krita
    blender
    figlet
    drawio
    penpot-desktop
  ];
}
