{ config, lib, pkgs, userConfig, ... }:

let
  secrets = userConfig.secrets or true;
in
lib.mkIf secrets {
  home.file = {
    ".ssh/id_ed25519".source = ../../../../secrets/ssh/personal;
    ".ssh/id_ed25519.pub".source = ../../../../assets/ssh/personal.pub;
    ".ssh/id_ed25519.1".source = ../../../../secrets/ssh/supsi;
    ".ssh/id_ed25519.1.pub".source = ../../../../assets/ssh/supsi.pub;
  };

  home.activation = {
    importGpgKey = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
      ${lib.getExe pkgs.gnupg} --batch --import \
        ${../../../../secrets/gpg/personal/public.pgp} \
        ${../../../../secrets/gpg/personal/private.asc} \
        ${../../../../secrets/gpg/supsi/public.asc} \
        ${../../../../secrets/gpg/supsi/private.asc};

        ${lib.getExe pkgs.gnupg} --import-ownertrust < ${../../../../secrets/gpg/ownertrust.txt}
    '';
  };
}
