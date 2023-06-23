{ pkgs, config, ... }:
{
  users.users.smartins = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
  };
}