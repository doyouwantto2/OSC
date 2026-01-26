{
  config,
  pkgs,
  ...
}:

{
  environment.systemPackages = with pkgs; [
    sqls
    sleek
  ];
}
