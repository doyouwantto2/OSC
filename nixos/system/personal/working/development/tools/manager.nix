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
    wezterm
    kitty
  ];
}
