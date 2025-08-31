{ config, pkgs, user, ... }:

{
  home.file = {
    "Documents/books".source = ./utilities/books;
    "Pictures/assets".source = ./utilities/assets;
  };
}
