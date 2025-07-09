{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    gnat
    gnumake
    cmake
    cpplint

    nodejs
    typescript
    flow
    ezno

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
    pyright

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
