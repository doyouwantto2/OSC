{
  config,
  pkgs,
  rustPkgs,
  ...
}:

{
  environment.systemPackages = with pkgs; [
    rustPkgs.rust-src
    rustPkgs.rustc
    rustPkgs.cargo
    rustPkgs.clippy
    rustPkgs.rustfmt
    rustPkgs.rust-analyzer
    cargo-tauri
    cargo-generate
    cargo-update
    cargo-edit
    sqlx-cli
    sea-orm-cli
  ];
}
