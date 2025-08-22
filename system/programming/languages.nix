{ config, pkgs, rustPkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    gnat
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

    rustPkgs.stable.rust-src
    rustPkgs.stable.rustc
    rustPkgs.stable.cargo
    rustPkgs.stable.clippy
    rustPkgs.stable.rustfmt
    rustPkgs.stable.rust-analyzer
    rustPkgs.targets.wasm32-unknown-unknown.latest.rust-std

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
