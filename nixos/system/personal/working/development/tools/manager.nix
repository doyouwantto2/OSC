{
  config,
  pkgs,
  ...
}:

{
  environment.systemPackages = with pkgs; [
    windsurf
    micro
    github-desktop
    neovim
    wezterm
    kitty
  ];
}
