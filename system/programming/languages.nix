{ config, pkgs, ... }:

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
        tensorflow
        })
        pydbus
        pygls
    ]))

    rustc
    rustup
    cargo
    dioxus-cli
    sea-orm-cli

    nixel
    nixf
    nixd

    hyprlang
    hyprls

    nasm
    wasmer
    wasm-bindgen-cli_0_2_100

    cockroachdb
  ];

}
