{ config, pkgs, stylix, ... }@inputs:

{
  stylix.enable = true;
  stylix.image = ./extra/wallpapers/GloriousEva.png;
  stylix.polarity = "dark";

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

  # Lazygit
  stylix.targets.lazygit.enable = true;

  # Fzf
  stylix.targets.fzf.enable = true;

  # Cursor
  stylix.cursor = {
    name = "BreezeX-RoséPine";
    package = pkgs.rose-pine-cursor;
    size = 22;
  };
}
