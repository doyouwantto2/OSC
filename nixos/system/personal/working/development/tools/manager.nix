{
  config,
  pkgs,
  ...
}:

{
  environment.systemPackages = with pkgs; [
    windsurf
    micro
    neovim
    hoppscotch
    wezterm
    grafana
    godot
    kitty
  ];
}
