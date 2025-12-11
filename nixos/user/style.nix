{ config, pkgs, stylix, ... }@inputs:

{
  stylix.enable = true;
  stylix.image = ./extra/wallpapers/GraveYard.png;
  stylix.polarity = "dark";

  # GNOME
  stylix.targets.gnome.enable = true;
  stylix.targets.gnome.useWallpaper = true;
  stylix.targets.gnome.cursor = {
    enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Ice";
    size = 24; # optional
  };

  # GTK
  stylix.targets.gtk.enable = true;
  stylix.targets.gtk.flatpakSupport.enable = true;

  # Firefox
  stylix.targets.firefox.enable = true;
  stylix.targets.firefox.profileNames = [ "default-release" ];
  stylix.targets.firefox.colorTheme.enable = true;
  stylix.targets.firefox.firefoxGnomeTheme.enable = true;

  # Cursor
  stylix.cursor = {
    enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Ice";
    size = 24;
  };
}
