{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    unzip
    zip

    gdb
    inxi

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
    gns3-server
    vpcs
    dynamips
    ubridge
    libcap
  ];
}

