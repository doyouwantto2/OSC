{
  config,
  pkgs,
  ...
}:

{
  programs.niri.enable = true;
  programs.xwayland.enable = true;

  services.power-profiles-daemon.enable = true;
  services.upower.enable = true;

  environment.systemPackages = with pkgs; [
    cava
    wl-clipboard
    wl-screenrec
    fastfetch
  ];
}
