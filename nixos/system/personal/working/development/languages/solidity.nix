{
  config,
  pkgs,
  ...
}:

{
  environment.systemPackages = with pkgs; [
    solc
    solc-select
    trufflehog
  ];
}
