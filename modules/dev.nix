{ config, lib, pkgs, modulesPath, ... }: {

  virtualisation.docker = {
    enable = true;

    storageDriver = if fileSystems."/".fsType == "btrfs" 
        then "btrfs" else null;
  };

  users.users.smartins.extraGroups = [ "docker" ];
}
