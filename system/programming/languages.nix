{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    gnat
    gnumake
    cmake

    nodejs
    javascript-typescript-langserver

    luarocks
    luajit
    lua

    (python3.withPackages (ps: with ps; [ 
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
