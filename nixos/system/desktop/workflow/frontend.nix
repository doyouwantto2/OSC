{ config, pkgs, quickshell, noctalia, ... }@inputs:

{
  environment.systemPackages = [
    quickshell.packages.${pkgs.stdenv.hostPlatform.system}.default
    pkgs.qt6.qtdeclarative
    pkgs.qt6.qtquickcontrols2
    pkgs.qt6.qtwayland
    pkgs.qt6.qttools
    pkgs.qt6.qtsvg
    pkgs.qt6.qtimageformats
    pkgs.qt6.qtmultimedia
    pkgs.qt6.qt5compat
    noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];
}

