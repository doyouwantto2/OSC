{ config, pkgs, rustPkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    gnat
    gnumake
    cmake
    ccls
    clang-tools

    arduino-cli

    nodejs
    typescript
    typescript-language-server

    sass
    sassc
    libsass

    vscode-langservers-extracted

    lua-language-server
    luarocks
    luajit
    lua

    (python3.withPackages (ps:
      with ps; [
        datasets
        kaggle

        numpy
        pandas
        opencv4
        matplotlib
        scikit-learn

        pytorch
        torchvision
        torchaudio
        botorch

        pydbus
        pyserial
        pygame
      ]))
    pyright

    rustPkgs.rust-src
    rustPkgs.rustc
    rustPkgs.cargo
    rustPkgs.clippy
    rustPkgs.rustfmt
    rustPkgs.rust-analyzer

    sqlx-cli
    sea-orm-cli

    nixel
    nixf
    nixd
    nixpkgs-fmt

    devenv
    cachix

    hyprlang
    hyprls

    qt6.qtbase
    qt6.qtdeclarative
    qt6.qtmultimedia
    qt6.qttools
    qt6.qtsvg
    qt6.qtwayland
  ];

}
