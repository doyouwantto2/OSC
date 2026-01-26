{
  config,
  pkgs,
  ...
}:

{
  environment.systemPackages = with pkgs; [
    (python3.withPackages (ps:
      with ps; [
        datasets
        kaggle

        numpy
        pandas
        opencv4
        matplotlib
        scikit-learn

        torch
        torchvision
        torchaudio
        botorch

        pydbus
        pyserial
        pygame
        pygobject3

        fastapi
        fastapi-cli
      ]))
    pyright
  ];
}
