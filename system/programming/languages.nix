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
        ps.tensorflow.overridePythonAttrs (old: { 
          meta = old.meta // { broken = false; }; 
        })
        pydbus
        pygls
    ]))

    rustc
    rustup
    dioxus-cli
    cargo

    nixel
    nixf
    nixd

    hyprlang
    hyprls

    nasm
    wasmer
    wasm-bindgen-cli_0_2_100
  ];

}
