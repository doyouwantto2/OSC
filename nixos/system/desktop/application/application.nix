{ config, pkgs, ... }:

{
  imports = [
    ./gui.nix

    ./tui.nix
  ];
}
