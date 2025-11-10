{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    neovim
    vscodium
    micro
    godot
    blender
  ];
}
