{
  config,
  pkgs,
  ...
}:

{
  imports = [
    ./study/study.nix
    ./working/working.nix
    ./entertainment/entertainment.nix
  ];
}
