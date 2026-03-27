{
  config,
  pkgs,
  ...
}:

{
  environment.systemPackages = with pkgs; [
    calibre-no-speech
    anki
  ];
}
