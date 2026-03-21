{
  config,
  pkgs,
  ...
}:

{
  programs.hyprland.enable = true;
  programs.mangowc.enable = true;
  programs.xwayland.enable = true;

  services.power-profiles-daemon.enable = true;
  services.upower.enable = true;

  # System packages including Hyprland plugins
  environment.systemPackages = with pkgs; [
    cava
    swappy
    swww
    brightnessctl
    grim
    slurp
    wl-clipboard
    wl-screenrec
    fastfetch
  ];
}
