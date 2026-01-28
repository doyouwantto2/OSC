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

  environment.sessionVariables = {
    HYPR_PLUGIN_DIR = pkgs.symlinkJoin {
      name = "hyprland-plugins";
      paths = with pkgs.hyprlandPlugins; [
        hy3
        hyprspace
      ];
    };
  };

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

    hyprlandPlugins.hy3
    hyprlandPlugins.hyprspace # Temporarily disabled due to build issues
  ];
}
