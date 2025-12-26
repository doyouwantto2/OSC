{ config, pkgs, user, stylix, ... }@inputs:

{
  stylix.enable = true;
  stylix.image = ./extra/wallpapers/GloriousEva.png;
  stylix.polarity = "dark";
  stylix.autoEnable = false;

  # GNOME
  stylix.targets.gnome.enable = true;
  stylix.targets.gnome.useWallpaper = true;


  # GTK
  stylix.targets.gtk.enable = true;
  stylix.targets.gtk.flatpakSupport.enable = true;

  # Firefox
  stylix.targets.firefox.enable = true;
  stylix.targets.firefox.profileNames = [ "default-release" ];
  stylix.targets.firefox.colorTheme.enable = true;
  stylix.targets.firefox.firefoxGnomeTheme.enable = true;

  # Vesktop
  stylix.targets.vesktop.enable = true;

  # Cursor
  stylix.cursor = {
    name = "Bibata-Modern-Classic";
    package = pkgs.bibata-cursors;
    size = 22;
  };
}
