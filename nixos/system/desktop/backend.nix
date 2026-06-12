{
  config,
  pkgs,
  ...
}:

{
  programs.hyprland.enable = true;
  programs.niri.enable = true;
  programs.xwayland.enable = true;

  services.power-profiles-daemon.enable = true;
  services.upower.enable = true;

  # System packages including Hyprland plugins
  environment.systemPackages = with pkgs; [
    cava
    swappy
    awww
    brightnessctl
    grim
    slurp
    wl-clipboard
    wl-screenrec
    fastfetch
  ];
}
