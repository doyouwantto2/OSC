{ config, pkgs, rust, ... }:

{
  environment.systemPackages = with pkgs; [
    gnat
    gnumake
    cmake

    nodejs
    typescript

    lua-language-server
    luarocks
    luajit
    lua

    (python3.withPackages (ps:
      with ps; [
        numpy
        pandas
        opencv
        matplotlib
        scikit-learn
        pytorch
        torchvision
        torchaudio
        botorch
        datasets
        pydbus
        pygls
    ]))
    pyright

    rust.rustc
    rust.cargo
    rust.clippy
    rust.rustfmt
    rust.rust-analyzer
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

    cockroachdb
  ];

}
