{ config, pkgs, user, ... }:

{
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
