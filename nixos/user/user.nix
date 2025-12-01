{ config, pkgs, user, ... }:

{
  imports = [
    ./file.nix
    ./shrc.nix
    ./style.nix
  ];

  home.username = user.name;
  home.homeDirectory = "/home/${user.name}";

  home.stateVersion = "25.11";

  programs.home-manager.enable = true;
}
