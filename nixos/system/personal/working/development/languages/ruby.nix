{
  config,
  pkgs,
  ...
}:

{
  environment.systemPackages = with pkgs; [
    ruby
    rubyfmt
    ruby-lsp
    bundler
    (ruby.withPackages (ps: with ps; [ rails ]))
  ];
}
