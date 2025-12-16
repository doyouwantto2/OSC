{ config, pkgs, rustPkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    gnat
    gnumake
    cmake
    ccls
    clang-tools

    nodejs
    bun

    nasm

    typescript
    typescript-language-server
    vscode-langservers-extracted

    angular-language-server

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
        pygobject3
      ]))
    pyright

    rustPkgs.rust-src
    rustPkgs.rustc
    rustPkgs.cargo
    rustPkgs.clippy
    rustPkgs.rustfmt
    rustPkgs.rust-analyzer
    cargo-tauri
    sqlx-cli
    sea-orm-cli

    jdk
    gradle
    google-java-format
    jdt-language-server

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
