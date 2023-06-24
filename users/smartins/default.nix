{ pkgs, config, ... }:
{

  users.users."smartins".shell = pkgs.fish;

  users.users.smartins = {
    isNormalUser = true;
    description = "Samuel Martins";
    extraGroups = [ "wheel" ];
  };
}