{ config, pkgs, ... }:

{
  nixpkgs.config.packageOverrides = super: let self = super.pkgs; in {
    python3 = self.python311;
  };

  environment.systemPackages = with pkgs; [
    (python3.withPackages (
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
        fastapi
        fastapi-cli
      ]
    ))
    pyright
  ];
}
