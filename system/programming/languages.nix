{ config, pkgs, rustPkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    gnat
    gnumake
    cmake
    ccls

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
      ]))
    pyright

    rustPkgs.rust-src
    rustPkgs.rustc
    rustPkgs.cargo
    rustPkgs.clippy
    rustPkgs.rustfmt
    rustPkgs.rust-analyzer

    loco
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
