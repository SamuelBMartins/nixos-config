{
  name = "work";
  system = "x86_64-linux";

  user = {
    name = "smartins";
    config = {
      work = true;
      keyboardLayout = [
        "gb"
        "ch+fr"
      ];

      # TODO find name package automatically
      autostart = [
        "org.gnome.Calendar"
        "org.gnome.Geary"
        "slack"
        "teams"
      ];
    };
  };

  modules = [
    # HW
    ../../modules/hardware/efi.nix
    ../../modules/hardware/tpm2.nix

    # DE 
    ../../modules/graphical/gnome.nix

    # Categories
    ../../modules/dev
    ../../modules/work
  ];
}
