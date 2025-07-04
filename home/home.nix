{ config, pkgs, user, ... }:

{
  home.username = user.name;
  home.homeDirectory = "/home/${user.name}";
}
