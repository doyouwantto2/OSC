{
  userName = "emiya2467";
  currentName = "emiya2467";
  currentSystem = "x86_64-linux";

  supportedSystems = [
    "x86_64-linux"
    "aarch64-linux"
  ];

  systemConfigs = {
    x86_64-linux = {
      graphics = {
        enable32Bit = true;
      };
    };
    aarch64-linux = {
      graphics = {
        enable32Bit = false;
      };
    };
  };
}
