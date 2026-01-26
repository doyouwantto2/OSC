{
  config,
  pkgs,
  ...
}:

{
  environment.systemPackages = with pkgs; [
    hyprlang
    hyprls
  ];
}
