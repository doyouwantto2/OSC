{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    gcc
    clang
    gnumake
    cmake
    ccls

    superhtml
    csslint

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
      ]))
    pyright

    rustup
    rustc
    cargo
    clippy
    rustfmt
    rust-analyzer

    dioxus-cli
    sea-orm-cli

    nixel
    nixf
    nixd
    nixpkgs-fmt

    hyprlang
    hyprls

    nasm
    wasmer
    wasm-bindgen-cli_0_2_100

  ];

}
