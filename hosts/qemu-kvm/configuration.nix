{
  name = "qemu-kvm";
  system = "x86_64-linux";

  user = {
    name = "smartins";
    
    config = {
      keyboardLayout = [
        "us+altgr-intl"
        "ch+fr"
      ];
    };
  };

  modules = [
    # HW
    ../../modules/hardware/efi.nix

    # DE 
    ../../modules/graphical/gnome.nix

    # Categories
    ../../modules/dev

    # Services
    ../../modules/qemu-guest.nix
  ];
}
