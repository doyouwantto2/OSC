{
  config,
  pkgs,
  ...
}:

{
  environment.systemPackages = with pkgs; [
    libreoffice
    davinci-resolve
    thunderbird
  ];
}
