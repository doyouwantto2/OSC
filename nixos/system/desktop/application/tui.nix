{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    unzip
    zip

    gdb
    dmidecode

    bat
    eza
    zoxide

    cava
    hyprshot
    screenfetch

    gnumake
    cmake

    btop
    crunch
    tshark
    termshark
    aircrack-ng
    sqlmap
    thc-hydra
    nmap

    windsurf
  ];
}

