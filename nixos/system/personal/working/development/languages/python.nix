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
        ultralytics

        pip

        numpy
        pandas
        opencv4Full
        matplotlib
        scikit-learn

        torch
        torchvision
        torchaudio
        botorch
        transformers
        scipy
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
