{ config, pkgs, quickShell, ... }:

{
  programs.hyprland.enable = true;
  programs.hyprlock.enable = true;

  environment.systemPackages = with pkgs; [
    waypaper
    quickShell.withModules
    [
      qt6.qtbase
      qt6.qtdeclarative
      qt6.qtmultimedia
      qt6.qttools
      qt6.qtsvg
      qt6.qtwayland
      qt6.qtspeech
      qt6.qtpositioning
      qt6.qtvirtualkeyboard
      qt6.qtwebsockets
      qt6.qtquick3d
    ]

    hyprcursor
    hyprpaper
  ];
}

