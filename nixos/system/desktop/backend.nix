{
  config,
  pkgs,
  ...
}:

{
  programs.hyprland.enable = true;
  programs.xwayland.enable = true;

  services.power-profiles-daemon.enable = true;
  services.upower.enable = true;

  # Hyprland plugins configuration using native NixOS packages
  # Available plugins from nixpkgs:
  # - borders-plus-plus -> adds one or two additional borders to windows
  # - hyprbars -> adds title bars to windows
  # - hyprfocus -> flashfocus for hyprland
  # - hyprscrolling -> adds a scrolling layout to hyprland
  # - hyprspace -> workspace overview plugin for hyprland
  # - hyprsplit -> plugin for awesome/dwm like workspaces
  # - hyprtrails -> adds smooth trails behind moving windows
  # - hyprwinwrap -> clone of xwinwrap, allows you to put any app as a wallpaper
  # - xtra-dispatchers -> adds some new dispatchers
  #
  # Enabled plugins:
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

    hyprlandPlugins.hy3
  ];
}
