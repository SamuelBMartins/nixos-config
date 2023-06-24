{ config, lib, pkgs, modulesPath, username, ... }: {

  virtualisation.docker = {
    enable = true;

    storageDriver = if fileSystems."/".fsType == "btrfs" 
        then "btrfs" else null;
  };

  users.users.${username}.extraGroups = [ "docker" ];
}
