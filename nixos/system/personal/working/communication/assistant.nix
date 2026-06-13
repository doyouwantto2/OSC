{
  config,
  pkgs,
  ...
}:

{
  environment.systemPackages = with pkgs; [
    librechat
    logseq
    syncthing
  ];
}
