{
  config,
  pkgs,
  ...
}:

{
  environment.systemPackages = with pkgs; [
    claude-code
    koboldcpp
    logseq
    syncthing
  ];
}
