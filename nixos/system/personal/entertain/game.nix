{
  config,
  pkgs,
  nixpkgs,
  lib,
  ...
}:

{
  programs.steam = lib.mkIf (pkgs.stdenv.isx86_64) {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;
    package = pkgs.steam.override {
      extraPkgs =
        pkgs': with pkgs'; [
          bumblebee
          primus
        ];
    };

    extraCompatPackages = with pkgs; [
      proton-ge-bin
    ];
  };

  environment.systemPackages = with pkgs; [
  ] ++ lib.optionals (pkgs.stdenv.isx86_64) [
    osu-lazer
    lutris
    protonup-qt
    wine
  ];

  nixpkgs.config.allowUnfreePredicate =
    pkg:
    builtins.elem (lib.getName pkg) [
      "steam"
      "steam-original"
      "steam-unwrapped"
      "steam-run"
    ];
}
