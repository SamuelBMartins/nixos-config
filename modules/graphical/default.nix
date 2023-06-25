{ ... }: {

  # imports = [
  #   "../core.nix"
  #   "../audio.nix"
  # ];

  services.flatpak.enable = true;
  hardware.opengl.enable = true;
}
