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
    hoppscotch
    metabase
    wezterm
    godot
    kitty
  ];

  nixpkgs.config.packageOverrides = pkgs: {
  metabase = pkgs.metabase.override {
    jdk = pkgs.jdk17;
  };
};
}
