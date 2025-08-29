{ config, pkgs, rustPkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    gnat
    gnumake
    cmake
    ccls
    clang-tools

    arduino-cli

    vscode-langservers-extracted
    nodejs
    typescript
    typescript-language-server

    lua-language-server
    luarocks
    luajit
    lua

    (python3.withPackages (ps:
      with ps; [
        datasets

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

    rustPkgs
    rust-analyzer
    rustfmt
    clippy

    dioxus-cli
    sqlx-cli
    sea-orm-cli

    nixel
    nixf
    nixd
    nixpkgs-fmt

    hyprlang
    hyprls

    wasm-pack
    wasm-bindgen-cli
    llvmPackages.bintools
  ];

}
