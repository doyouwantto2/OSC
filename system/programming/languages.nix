{ config, pkgs, rust, ... }:

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

    rust.stable.rust-src
    rust.stable.rustc
    rust.stable.cargo
    rust.stable.clippy
    rust.stable.rustfmt
    rust.stable.rust-analyzer
    rust.targets.wasm32-unknown-unknown.latest.rust-std

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
