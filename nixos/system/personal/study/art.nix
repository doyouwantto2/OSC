{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    krita
    blender
    inkscape
    drawio
    pencil
  ];
}
