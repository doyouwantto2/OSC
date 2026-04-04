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
    wezterm
    godot
    kitty
  ];
}
