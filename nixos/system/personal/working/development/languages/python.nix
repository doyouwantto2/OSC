{
  config,
  pkgs,
  ...
}:

{
  environment.systemPackages = with pkgs; [
    (python3.withPackages (
      ps: with ps; [
        datasets
        kaggle

        opencv-python-headless
        tensorflow-lite
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
