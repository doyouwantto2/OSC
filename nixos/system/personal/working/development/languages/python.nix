{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    (python313.withPackages (
      ps: with ps; [
        kaggle
        pylatexenc
        opencv-python-headless
        pygame
        numpy
        pandas
        matplotlib
        scikit-learn
        ollama
      ]
    ))

    positron-bin
    pyright
  ];
}
