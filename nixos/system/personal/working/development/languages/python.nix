{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    (python312.withPackages (
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
      ]
    ))
    pyright
  ];
}
