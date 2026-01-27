{ config, pkgs, userName, ... }:

{
  imports = [
    ./aliases.nix
    ./shell.nix
    ./cloud.nix
  ];
}
