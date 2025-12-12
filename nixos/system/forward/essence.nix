{ config, pkgs, ... }:

{
  programs.hyprland.enable = true;
  programs.niri.enable = true;

  programs.nix-ld.enable = true;
  programs.xwayland.enable = true;

  services.power-profiles-daemon.enable = true;
  services.upower.enable = true;

  environment.systemPackages = with pkgs; [
    git
    wezterm
    kitty
    disko
    wl-clipboard
    pulseaudio
    xdg-desktop-portal
    xdg-desktop-portal-gtk
    xdg-desktop-portal-wlr
    xdg-desktop-portal-gnome
    xdg-desktop-portal-hyprland
    openssl
    pkg-config
    glib
    gobject-introspection
    gtk3
    gtk4
    libiconv
  ];
}
