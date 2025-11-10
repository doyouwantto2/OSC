{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    lazygit
    imagemagick
    ghostscript
    fzf
    ripgrep
    fd
    mmdbctl
    wget
    tectonic
    lldb
    tree-sitter
    direnv
    dotenvx
  ];
}

