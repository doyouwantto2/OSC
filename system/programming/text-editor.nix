{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    vscodium
    micro
    neovim
    mysql-workbench

    wl-clipboard
    ripgrep
    fd
    sqlite
    lazygit
    imagemagick
    ghostscript
  ]; 
}
