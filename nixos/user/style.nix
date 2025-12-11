{ config, pkgs, stylix, ... }@inputs:

{
  stylix.enable = true;
  stylix.image = ./extra/wallpapers/GloriousEva.png;
  stylix.polarity = "modern";

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

  # Btop
  stylix.targets.btop.enable = true;

  # Vesktop
  stylix.targets.vesktop.enable = true;

  # Lazygit
  stylix.targets.lazygit.enable = true;

  # Fzf
  stylix.targets.fzf.enable = true;

  # Micro
  stylix.targets.micro.enable = true;

  # Cursor
  stylix.cursor = {
    name = "Bibata-Modern-Ice";
    package = pkgs.bibata-cursors;
    size = 24;
  };
}
