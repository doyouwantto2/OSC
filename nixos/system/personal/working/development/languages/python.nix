{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    (python313.withPackages (
      ps: with ps; [
        datasets
        kaggle
        opencv-python-headless
        pygame
        numpy
        pandas
        matplotlib
        scikit-learn
        torch
        torchvision
        torchaudio
        botorch
        ollama
        pydbus
        pyserial
        pygobject3
        manim
      ]
    ))
    pyright
  ];
}
