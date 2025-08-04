{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    vscodium
    micro
    neovim
    dbgate

    wl-clipboard
    sqlite
    lazygit
    imagemagick
    ghostscript
  ]; 
}
