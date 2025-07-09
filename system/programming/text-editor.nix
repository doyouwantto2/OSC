{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    vscodium
    micro
    neovim

    neovim
    ripgrep
    fd
    sqlite
    lazygit
    imagemagick
    ghostscript
  ]; 
}
