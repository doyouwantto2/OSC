{ config, pkgs, ... }:

{
  imports = [ 
    ./workspace/workspace.nix
    ./apps/apps.nix
  ]; 
}
