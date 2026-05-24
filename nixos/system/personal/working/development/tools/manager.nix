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
    metabase
    wezterm
    godot
    kitty
  ];
}
