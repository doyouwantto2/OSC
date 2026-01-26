{
  config,
  pkgs,
  user,
  ...
}:

let
  userName = user.name;
in

{
  imports = [
  ];

  home.username = userName;
  home.homeDirectory = "/home/${userName}";

  home.stateVersion = "26.05";

  programs.home-manager.enable = true;
}
