{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    neovim
    zed-editor
    micro
    godot
    blender
  ];
}
