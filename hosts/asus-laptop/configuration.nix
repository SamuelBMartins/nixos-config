{
  name = "asus-laptop";
  system = "x86_64-linux";

  user = {
    name = "smartins";
    config = {
      wall = ../../assets/walls/anime1.jpg;
      keyboardLayout = [
        "ch+fr"
      ];

      autostart = [
        "synology-drive"
      ];
    };
  };

  modules = [
    ./default.nix

    # HW
    ../../modules/hardware/efi.nix
    ./nvidia-offload.nix
    ../../modules/hardware/tpm2.nix

    # DE 
    ../../modules/graphical/gnome.nix

    # Categories
    ../../modules/dev
    ../../modules/media
    ../../modules/gaming
    ../../modules/work

    # Services
    ../../modules/ssh.nix
  ];
}
