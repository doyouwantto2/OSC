{ config, pkgs, stylix, ... }@inputs:

{
  stylix.enable = true;
  stylix.image = ./extra/wallpapers/GloriousEva.png;
  stylix.polarity = "dark";

  # GNOME
  stylix.targets.gnome.enable = true;
  stylix.targets.gnome.useWallpaper = true;
  stylix.targets.gnome.fonts.enable = true;

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
  stylix.targets.btop.opacity.enable = true;
  stylix.targets.btop.colors.enable = true;

  # Vesktop
  stylix.targets.vesktop.enable = true;
  stylix.targets.vesktop.colors.enable = true;
  stylix.targets.vesktop.fonts.enable = true;

  # Lazygit
  stylix.targets.lazygit.enable = true;
  stylix.targets.lazygit.colors.enable = true;

  # Fzf
  stylix.targets.fzf.enable = true;
  stylix.targets.fzf.colors.enable = true;

  # Micro
  stylix.targets.micro.enable = true;
}
