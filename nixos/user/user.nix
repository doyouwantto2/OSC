{
  config,
  pkgs,
  shared,
  ...
}:

let
  userName = shared.currentName;
in

{
  imports = [
    ./environment/environment.nix
    ./storage/storage.nix
    ./style.nix
  ];

  home.username = userName;
  home.homeDirectory = "/home/${userName}";

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.sessionVariables = {
    EDITOR = "nvim";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "26.05";

  # Pass userName to environment modules
  _module.args.userName = userName;
}
