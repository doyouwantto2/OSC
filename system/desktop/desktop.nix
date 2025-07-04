{ config, pkgs, ... }:

{
  import = [ ./basic.nix ]; 

  program.hyprland.enable = true;
}
