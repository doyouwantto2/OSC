{
  userName = "emiya2467";
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
