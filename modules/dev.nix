{ username, ... }: {

  virtualisation.docker = {
    enable = true;

    (
      if fileSystems."/".fsType == "btrfs" 
        then storageDriver = "btrfs" 
        else storageDriver = null;
    )

  };

  users.users.${username}.extraGroups = [ "docker" ];
}
