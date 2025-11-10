{ config, pkg, ... }:

{
  imports = [
    ./backend.nix
    ./frontend.nix
  ];
}

