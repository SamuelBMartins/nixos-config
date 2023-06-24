{ config, username, ... }: {

  virtualisation.docker = {
    enable = true;

    
    storageDriver = if config.fileSystems."/".fsType == "btrfs" 
        then "btrfs" else null;
  };

  users.users.${username}.extraGroups = [ "docker" ];
}
