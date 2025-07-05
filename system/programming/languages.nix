{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    gnat
    gnumake
    cmake

    nodejs
    javascript-typescript-langserver

    lua-language-server
    luarocks
    luajit
    lua
    ccls

    (python3.withPackages (ps:
      with ps; [
        numpy
        pandas
        opencv
        matplotlib
        scikit-learn
        pydbus
        pygls
    ]))

    ruby
    rubyPackages.rails
    rubyPackages.railties
    rubyPackages.language_server-protocol

    rustc
    cargo
    rune-languageserver

    nixel
    nixf
    nixd

    hyprlang
    hyprls

  ];
}
