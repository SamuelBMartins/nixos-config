{ config, pkgs, username, ... }: {

  imports = [
    ../zsh.nix
  ];

  virtualisation.docker.enable = true;
  users.users.${username}.extraGroups = [ "docker" ];
}
