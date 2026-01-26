{
  config,
  pkgs,
  lib,
  ...
}:

{

  programs.nix-ld.enable = true;

  # Intel CPU microcode updates (only for x86 systems)
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;

  environment.systemPackages = with pkgs; [
    # Utilities
    alsa-lib
    udev
    spacedrive
    pulseaudio

    # Portal
    xdg-desktop-portal
    xdg-desktop-portal-gtk
    xdg-desktop-portal-wlr
    xdg-desktop-portal-gnome
    xdg-desktop-portal-hyprland

    # Tauri / asm
    openssl
    pkg-config
    glib
    gobject-introspection
    gtk3
    gtk4
    libiconv

    # Games
    xorg.libXcursor
    xorg.libXi
    xorg.libXinerama
    xorg.libXScrnSaver
    libpng
    libpulseaudio
    libvorbis
    stdenv.cc.cc.lib
    libkrb5
    keyutils
  ];

}
