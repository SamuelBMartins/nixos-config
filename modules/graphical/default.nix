{ ... }: {

  imports = [
    ../core
    ../audio.nix
  ];

  services.flatpak.enable = true;
  hardware.opengl.enable = true;
}
