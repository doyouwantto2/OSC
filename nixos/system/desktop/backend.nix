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

  # Plugin directory setup for Hyprland
  environment.sessionVariables = {
    HYPR_PLUGIN_DIR = pkgs.symlinkJoin {
      name = "hyprland-plugins";
      paths = with pkgs.hyprlandPlugins; [
        hy3
        hyprexpo
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
    
    # Hyprland plugins (also added to HYPR_PLUGIN_DIR)
    hyprlandPlugins.hy3
    hyprlandPlugins.hyprexpo
  ];
}
