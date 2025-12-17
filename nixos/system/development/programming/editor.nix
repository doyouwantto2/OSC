{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    neovim
    vscodium
    micro
    notepadqq
    godot
    blender
  ];
}
