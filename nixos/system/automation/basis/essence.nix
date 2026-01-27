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

  # Core system packages only (no development tools)
  environment.systemPackages = with pkgs; [
    # Basic system utilities
    alsa-lib
    udev
    
    # Basic network utilities
    curl
    netcat
    
    # File management
    spacedrive
    
    # Audio
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
