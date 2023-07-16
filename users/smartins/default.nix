{ config, ... }:
{
  users.users.smartins = {
    isNormalUser = true;
    description = "Samuel Martins";
    extraGroups = [ "wheel" ];
  };
}
