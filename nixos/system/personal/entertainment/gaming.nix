{
  config,
  pkgs,
  nixpkgs,
  lib,
  ...
}:

{
  environment.systemPackages =
    with pkgs;
    [
    ]
    ++ lib.optionals (pkgs.stdenv.isx86_64) [
    ];

  nixpkgs.config.allowUnfreePredicate =
    pkg:
    builtins.elem (lib.getName pkg) [
      "steam"
      "steam-original"
      "steam-unwrapped"
      "steam-run"
    ];

  hardware.graphics.enable = true;

}
