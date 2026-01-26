{
  config,
  pkgs,
  ...
}:

{
  environment.systemPackages = with pkgs; [
    git
    git-lfs
    lazygit
    imagemagick
    ghostscript
    fzf
    ripgrep
    fd
    mmdbctl
    wget
    tectonic
    tree-sitter
    direnv
    zoxide
    btop
    eza
    unzip
    zip
  ];
}
