{ config, pkgs, username, ... }: {

  virtualisation.docker.enable = true;
  users.users.${username}.extraGroups = [ "docker" ];

  fonts.fonts = with pkgs; [
    (nerdfonts.override { fonts = [ "JetBrains Mono" ]; })
  ];
  console.font = "JetBrains Mono";
}
