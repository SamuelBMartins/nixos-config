{ config, pkgs, lib, userConfig, ... }:
let
  work = userConfig.work or false;
in
{
  programs.git = {
    enable = true;
    userName = "Samuel Martins";
    userEmail = if work 
      then "samuel.debabomartins@supsi.ch"
      else "s@smartins.ch" ;
    signing.key = null; # GPG decides appropriate key to use based on email
    signing.signByDefault = true;
    extraConfig = {
      pull.rebase = true;
      init.defaultBranch = "master";
    };

    includes = [
      {
        contents = {
          gpg.program = "gpg2";
        };
      }
    ];
  };

  # home.activation = {
  #   importGpgKey = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
  #     $DRY_RUN_CMD ${lib.getExe pkgs.gnupg} --import ${
  #       privateDir + "/gpg.key"
  #     }
  #   '';
  # };
}
