{
  config,
  pkgs,
  user,
  stylix,
  ...
}@inputs:

{
  stylix.enable = true;
  stylix.image = ./storage/wallpapers/GloriousEva.png;
  stylix.polarity = "dark";
  stylix.autoEnable = false;

  # GNOME
  stylix.targets.gnome.enable = true;
  stylix.targets.gnome.useWallpaper = true;

  # GTK
  stylix.targets.gtk.enable = true;
  stylix.targets.gtk.flatpakSupport.enable = true;

  # Librewolf
  stylix.targets.librewolf.enable = true;
  stylix.targets.librewolf.fonts.enable = true;
  stylix.targets.librewolf.inputs.enable = true;
  stylix.targets.librewolf.firefoxGnomeTheme.enable = true;
  stylix.targets.librewolf.profileNames = [ "default-release" ];

  # Vesktop
  stylix.targets.vesktop.enable = true;

  # Cursor
  stylix.cursor = {
    name = "Bibata-Modern-Classic";
    package = pkgs.bibata-cursors;
    size = 22;
  };
}
