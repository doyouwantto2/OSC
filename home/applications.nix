{ config, pkgs, user, ... }:

{
  programs.home-manager.enable = true;

  programs.steam = {
    enable = true;
  };

  programs.bash {
    enable = true;
    shellAliases = {
      ll = "ls -l";
      cls = "clear";
    };
  };
  
}
