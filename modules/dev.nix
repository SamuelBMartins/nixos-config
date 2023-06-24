{ config, username, ... }: {

  virtualisation.docker.enable = true;
  users.users.${username}.extraGroups = [ "docker" ];

  fonts.fonts = with pkgs; [
    (nerdfonts.override { fonts = [ "Monospace" ]; })
  ];
  console.font = "Monospace";
}
