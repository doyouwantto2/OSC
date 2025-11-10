{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    bat
    eza
    zoxide
    cava
    hyprshot
    dmidecode
    btop
    gnumake
    cmake
    screenfetch
    crunch
    tshark
    termshark
    unzip
    zip
    gdb
  ];
}

