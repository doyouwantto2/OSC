{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    vscodium
    micro
    neovim

    wl-clipboard
    sqlite
    lazygit
    imagemagick
    ghostscript
  ];
}
