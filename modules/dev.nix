{ config, pkgs, username, ... }: {

  virtualisation.docker.enable = true;
  users.users.${username}.extraGroups = [ "docker" ];

  fonts.fonts = with pkgs; [
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
  ];
  console.font = "JetBrainsMono";
}
