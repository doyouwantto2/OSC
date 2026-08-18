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
    rails-new
  ];
}
