{
  config,
  pkgs,
  shared,
  ...
}:

let
  userName = shared.currentName;
in

{
  imports = [
    ./environment.nix
    ./style.nix
    ./storage.nix
  ];

  home.username = userName;
  home.homeDirectory = "/home/${userName}";

  home.stateVersion = "26.05";

  programs.home-manager.enable = true;
}
