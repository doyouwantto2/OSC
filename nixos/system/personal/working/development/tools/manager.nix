{
  config,
  pkgs,
  ...
}:

{
  environment.systemPackages = with pkgs; [
    micro
    neovim
    hoppscotch
    metabase
    wezterm
    godot
    kitty
  ];
}
