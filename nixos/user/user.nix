{ config, pkgs, name, ... }:

{
  imports = [
    ./file.nix
    ./shrc.nix
    ./style/style.nix
  ];

  home.username = name;
  home.homeDirectory = "/home/${name}";

  home.stateVersion = "25.05";

  programs.home-manager.enable = true;
}
