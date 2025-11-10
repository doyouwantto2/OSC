{ config, pkgs, user, ... }:

{
  imports = [
    ./file.nix
    ./shrc.nix
    ./style/style.nix
  ];

  home.username = user.name;
  home.homeDirectory = "/home/${user.name}";

  home.stateVersion = "25.05";

  programs.home-manager.enable = true;
}
