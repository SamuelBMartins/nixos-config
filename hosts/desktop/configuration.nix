{
  name = "desktop";
  system = "x86_64-linux";

  user = {
    name = "smartins";
    config = {
      wall = ../../assets/walls/hololive.jpg;

      keyboardLayout = [
        "us+altgr-intl"
      ];

      autostart = [
        "discord"
        "synology-drive"
      ];
    };
  };

  modules = [
    ./default.nix
    
    # HW
    ../../modules/hardware/efi.nix
    ../../modules/hardware/tpm2.nix
    ../../modules/hardware/nvidia.nix

    # DE 
    ../../modules/graphical/gnome.nix

    # Categories
    ../../modules/dev
    ../../modules/media
    ../../modules/gaming
    ../../modules/work
  ];
  
}
