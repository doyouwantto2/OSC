{
  config,
  pkgs,
  ...
}:

{
  environment.systemPackages = with pkgs; [
    windsurf
    zed-editor
    micro
    neovim
    wezterm
    kitty
  ];
}
