{
  config,
  pkgs,
  ...
}:

{
  environment.systemPackages = with pkgs; [
    odoo
    libreoffice
    thunderbird
  ];
}
