{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    vscodium
    micro
    neovim
    dbgate

    wl-clipboard
    ripgrep
    fd
    sqlite
    lazygit
    imagemagick
    ghostscript
  ]; 
}
