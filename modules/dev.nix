{ username, ... }: {

  virtualisation.docker = {
    enable = true;
  };

  virtualisation.docker.storageDriver = if fileSystems."/".fsType == "btrfs"
    then "btrfs" else null;
  users.users.${username}.extraGroups = [ "docker" ];
}
