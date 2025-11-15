{ config, pkgs, rustPkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    gnat
    gnumake
    cmake
    ccls
    clang-tools

    nasm

    nodejs
    typescript
    typescript-language-server
    vscode-langservers-extracted

    astro-language-server

    tailwindcss
    tailwindcss-language-server

    lua-language-server
    luarocks
    luajit
    stylua
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

        torch
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

    jdk
    gradle
    google-java-format
    jdt-language-server

    kotlin
    ktfmt
    kotlin-language-server

    nixel
    nixf
    nixd
    nixpkgs-fmt

    devenv
    cachix

    hyprlang
    hyprls

    sqls
    sleek

    solc
    solc-select
    trufflehog
  ];
}
