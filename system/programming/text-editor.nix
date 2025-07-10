{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    vscodium
    micro
    neovim

    wl-clipboard
    ripgrep
    fd
    sqlite
    lazygit
    imagemagick
    ghostscript
  ]; 
}
