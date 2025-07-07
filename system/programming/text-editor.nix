{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    vscodium
    micro
    neovim

    tree-sitter
    ripgrep
    fd
    sqlite
    lazygit
    imagemagick
    ghostscript
    wget
  ]; 
}
