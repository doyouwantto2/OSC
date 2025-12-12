{ config, pkgs, ... }@inputs:

{
  environment.systemPackages = with pkgs; [
    quickshell
    qt6.qtdeclarative
    qt6.qtwayland
    qt6.qttools
    qt6.qtsvg
    qt6.qtimageformats
    qt6.qtmultimedia
    papirus-icon-theme
  ];
}

