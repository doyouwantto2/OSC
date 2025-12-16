{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    neovim
    vscodium
    zed-editor
    micro
    godot
    blender
  ];
}
