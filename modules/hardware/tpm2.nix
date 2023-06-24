{ pkgs, cryptDisk, ... }: 
let
  tpm2-update = pkgs.writeShellScriptBin "tpm2-update" ''
    sudo systemd-cryptenroll --wipe-slot=tpm2 ${boot.initrd.luks.devices.${cryptDisk}.device}; sudo systemd-cryptenroll --tpm2-pcrs=0+2+4 ${boot.initrd.luks.devices.${cryptDisk}.device}
  '';
in
{
  environment.systemPackages = with pkgs; [
    tpm2-tss
    tpm2-update
  ];
  
}
