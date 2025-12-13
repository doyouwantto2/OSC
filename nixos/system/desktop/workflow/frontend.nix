{ config, pkgs, noctalia, ... }@inputs:

{
  environment.systemPackages = with pkgs; [
    quickshell
    noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default
    qt6.qtdeclarative
    qt6.qtwayland
    qt6.qttools
    qt6.qtsvg
    qt6.qtimageformats
    qt6.qtmultimedia
    qt6.qt5compat
    papirus-icon-theme
  ];
}

