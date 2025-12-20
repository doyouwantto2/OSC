{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    neovim
    windsurf
    micro
    godot
    blender
  ];
}
