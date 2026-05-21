{
  config,
  pkgs,
  ...
}:

{
  environment.systemPackages = with pkgs; [
    texlab
    texliveFull
  ];
}
