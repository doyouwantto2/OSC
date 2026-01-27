{
  config,
  pkgs,
  ...
}:

{
  environment.systemPackages = with pkgs; [
    koodo-reader
    logseq
  ];
}
