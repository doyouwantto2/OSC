{ config, pkgs, rustPkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    gnat
    gnumake
    cmake
    ccls
    clang-tools

    nodejs
    typescript
    typescript-language-server
    vscode-langservers-extracted

    tailwindcss

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

    bacon
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

  ];

}
