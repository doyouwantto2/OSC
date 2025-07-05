{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    vscodium

    neovim
    ripgrep
    fd
    sqlite
    lazygit
    imagemagick
    ghostscript
    tectonic
    graphviz
    mermaid-cli
    texlive.combined.scheme-full
  ]; 
}
