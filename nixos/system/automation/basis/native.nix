{
  config,
  pkgs,
  lib,
  ...
}:

{

  fonts = {
    enableDefaultPackages = true;

    packages =
      with pkgs;
      [
        dejavu_fonts
        liberation_ttf

        noto-fonts
        noto-fonts-extra

        noto-fonts-cjk-sans
        noto-fonts-cjk-serif

        noto-fonts-emoji

        symbola
      ]
      ++ builtins.filter lib.attrsets.isDerivation (builtins.attrValues pkgs.nerd-fonts);

    fontconfig = {
      enable = true;
      defaultFonts = {
        sansSerif = [
          "Noto Sans"
          "Noto Sans CJK JP"
        ];
        serif = [
          "Noto Serif"
          "Noto Serif CJK JP"
        ];
        monospace = [
          "JetBrainsMono Nerd Font"
          "Noto Sans Mono"
        ];
        emoji = [ "Noto Color Emoji" ];
      };
    };
  };
  i18n.inputMethod = {
    type = "fcitx5";
    enable = true;
    fcitx5.addons = with pkgs; [
      fcitx5-mozc
      fcitx5-gtk
      fcitx5-bamboo
    ];
  };

  xdg.portal.wlr.enable = true;
  xdg.portal.enable = true;
  xdg.portal.extraPortals = [
    pkgs.xdg-desktop-portal-gtk
    pkgs.xdg-desktop-portal-hyprland
    pkgs.xdg-desktop-portal-gnome
  ];
  xdg.portal.configPackages = [ pkgs.xdg-desktop-portal-wlr ];

  nix.extraOptions = ''
    keep-outputs = true
    keep-derivations = true
  '';

  environment.sessionVariables = {
    OPENSSL_DIR = "${pkgs.openssl.dev}";
    OPENSSL_LIB_DIR = "${pkgs.openssl.out}/lib";
    OPENSSL_INCLUDE_DIR = "${pkgs.openssl.dev}/include";
    PKG_CONFIG_PATH = "${pkgs.openssl.dev}/lib/pkgconfig";
    GI_TYPELIB_PATH = lib.makeSearchPath "lib/girepository-1.0" (
      with pkgs;
      [
        evolution-data-server
        libical
        glib.out
        libsoup_3
        json-glib
        gobject-introspection
      ]
    );
  };
}
