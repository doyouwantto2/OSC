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
    ]))
    ty

    ruby
    rubyPackages.rails
    rubyPackages.railties
    rubocop

    rustc
    cargo
    rune-languageserver

    nil
  ];
}
