{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    gnat
    gnumake
    cmake
    ccls
    mesonlsp

    nodejs
    javascript-typescript-langserver

    lua-language-server
    luarocks
    luajit
    lua

    (python3.withPackages (ps: with ps; [ 
      numpy
      pandas 
      opencv
      matplotlib
      scikit-learn
    ]))
    ty

    ruby
    rubyPackages.rails
    rubyPackages.railties
    rubyPackages.language_server-protocol

    rustc
    cargo
    rune-languageserver

    nil
  ];
}
