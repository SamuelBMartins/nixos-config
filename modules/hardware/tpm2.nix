{ config, pkgs, lib, ... }: 

let
  tpm2-update = pkgs.writeShellScriptBin "tpm2-update" ''
    systemd-cryptenroll --wipe-slot=tpm2 ${config.boot.initrd.luks.devices."nixos".device}; 
    PASSWORD=${builtins.readFile ../../secrets/crypt} systemd-cryptenroll --tpm2-pcrs=0+2+4 --tpm2-device=/dev/tpmrm0 ${config.boot.initrd.luks.devices."nixos".device}
  '';
in
{
  environment.systemPackages = with pkgs; [
    tpm2-tss
    tpm2-update
  ];

  systemd.services.tpm2-update = {
    script = ''
      ${lib.getExe tpm2-update}
    '';
    wantedBy = [ "multi-user.target" ];
  };
 
}
