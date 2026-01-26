{
  config,
  pkgs,
  ...
}:

{
  environment.systemPackages = with pkgs; [
    wezterm
    kitty
  ];
}
